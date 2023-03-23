//
//  SearchLocationView.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/3/2023.
//

import SwiftUI
import MapKit

struct SearchLocationView: View {
    @EnvironmentObject var manager: SearchLocationManager
    @Binding var navigationPath: [SaveGridContentModal.Path]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.SearchLocation.findLocation)
                .font(.title3)
                .fontWeight(.semibold)
            searchField
            if let places = manager.fetchedPlaces, !places.isEmpty {
                searchList(places: places)
            } else {
                currentLocationButton
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .alert(item: $manager.error) { error in
            Alert(
                title: Text(Constants.SearchLocation.ErrorAlert.title),
                message: Text(error.message),
                dismissButton: .default(Text(Constants.SearchLocation.ErrorAlert.okGotIt))
            )
        }
    }
}

private extension SearchLocationView {
    var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(Constants.SearchLocation.searchLocation, text: $manager.searchText)
            Image(systemName: "x.circle.fill")
                .foregroundColor(.gray)
                .onTapGesture {
                    manager.searchText = ""
                }
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .strokeBorder(.gray)
        }
        .padding(.vertical, 10)
    }
    
    var currentLocationButton: some View {
        Button {
            manager.setUserLocation()
            navigationPath.append(SaveGridContentModal.Path.mapDetail)
        } label: {
            Label {
                Text(Constants.SearchLocation.useCurrentLocation)
                    .font(.callout)
            } icon: {
                Image(systemName: "location.north.circle.fill")
            }
            .foregroundColor(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func searchList(places: [CLPlacemark]) -> some View {
        List {
            ForEach(places, id: \.self) { place in
                rowView(forPlace: place)
            }
        }
        .listStyle(.plain)
    }
    
    func rowView(forPlace place: CLPlacemark) -> some View {
        Button {
            manager.setPickedLocation(place.location)
            navigationPath.append(.mapDetail)
        } label: {
            HStack(spacing: 15) {
                Image(systemName: "mappin.circle.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
                VStack(alignment: .leading, spacing: 6) {
                    Text(place.name ?? "")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                    Text(place.locality ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct SearchLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocationView(navigationPath: .constant([]))
            .environmentObject(SearchLocationManager())
    }
}
