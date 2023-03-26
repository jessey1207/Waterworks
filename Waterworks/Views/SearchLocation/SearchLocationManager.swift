//
//  SearchLocationManager.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/3/2023.
//

import MapKit
import Combine

class SearchLocationManager: NSObject, ObservableObject {
    @Published var mapView: MKMapView = .init()
    @Published var searchText: String = ""
    @Published var confirmedPlacemark: CLPlacemark?
    @Published var fetchedPlaces: [CLPlacemark]?
    @Published var error: SearchLocationManagerError?
    
    @Published private(set) var pickedPlacemark: CLPlacemark?
    
    @Published private var locationManager: CLLocationManager = .init()
    @Published private var userLocation: CLLocation?
    @Published private var pickedLocation: CLLocation? {
        didSet {
            updatePlacemark(location: pickedLocation)
        }
    }
    
    private var cancellable: AnyCancellable?
    
    override init() {
        super.init()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { value in
                if value != "" {
                    Task {
                        try await self.fetchPlacemarks(searchString: value)
                    }
                } else {
                    // Ensure results list is empty when search is empty
                    self.fetchedPlaces = nil
                }
            }
    }

    func setUserLocation() {
        guard let coordinate = userLocation?.coordinate else { return }
        setMapViewCoordinate(coordinate)
    }
    
    func setPickedLocation(_ location: CLLocation?) {
        guard let location else { return }
        pickedLocation = location
        setMapViewCoordinate(location.coordinate)
    }
    
    func setConfirmedLocation(_ location: CLLocation?) {
        setPickedLocation(location)
        confirmedPlacemark = pickedPlacemark
    }
    
    func reset() {
        pickedLocation = nil
        mapView.removeAnnotations(mapView.annotations)
    }
}

// MARK: - MKMapViewDelegate

extension SearchLocationManager: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "USERLOCATIONPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else { return }
        let pickedLocation: CLLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
        self.pickedLocation = pickedLocation
        updatePlacemark(location: pickedLocation)
    }
}

// MARK: - CLLocationManagerDelegate

extension SearchLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        handleError(.general)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        self.userLocation = currentLocation
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied:
            handleError(.authorizationDenied)
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}

// MARK: - Async

private extension SearchLocationManager {
    func fetchPlacemarks(searchString: String) async throws {
        do {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = searchString.lowercased()
            
            let response = try await MKLocalSearch(request: request).start()
            await MainActor.run {
                self.fetchedPlaces = response.mapItems.compactMap { $0.placemark }
            }
        } catch {
            handleError(.fetchPlacemarks)
        }
    }
    
    func setPlacemark(location: CLLocation) async throws {
        do {
            guard let place = try await getPlacemarkFromLocation(location) else { return }
            await MainActor.run {
                self.pickedPlacemark = place
            }
        } catch {
            handleError(.getPlacemark)
        }
    }
}

// MARK: - Private

private extension SearchLocationManager {
    func setMapViewCoordinate(_ coordinate: CLLocationCoordinate2D) {
        mapView.region = .init(
            center: coordinate,
            latitudinalMeters: Constants.SearchLocation.Map.radius,
            longitudinalMeters: Constants.SearchLocation.Map.radius
        )
        addDraggablePin(coordinate: coordinate)
        updatePlacemark(
            location: .init(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        )
    }
    
    func addDraggablePin(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = Constants.SearchLocation.Map.annotationTitle
        mapView.addAnnotation(annotation)
    }
    
    func updatePlacemark(location: CLLocation?) {
        if let location {
            Task {
                try await setPlacemark(location: location)
            }
        } else {
            pickedPlacemark = nil
        }
    }
    
    func getPlacemarkFromLocation(_ location: CLLocation) async throws -> CLPlacemark? {
        try await CLGeocoder().reverseGeocodeLocation(location).first
    }
    
    func handleError(_ error: SearchLocationManagerError) {
        Task {
             await MainActor.run {
                self.error = error
            }
        }
    }
}

// MARK: - Error handling

extension SearchLocationManager {
    enum SearchLocationManagerError: Error, Identifiable {
        case authorizationDenied
        case fetchPlacemarks
        case getPlacemark
        case general
        
        var message: String {
            switch self {
            case .authorizationDenied:
                return Constants.SearchLocation.ErrorAlert.enableLocationServices
            case .fetchPlacemarks:
                return Constants.SearchLocation.ErrorAlert.noPlaces
            case .getPlacemark:
                return Constants.SearchLocation.ErrorAlert.noPlace
            case .general:
                return Constants.SearchLocation.ErrorAlert.tryAgain
            }
        }
        
        var id: String { message }
    }
}
