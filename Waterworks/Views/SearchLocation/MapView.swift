//
//  MapView.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/3/2023.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var searchLocationManager: SearchLocationManager
    
    func makeUIView(context: Context) -> MKMapView {
        searchLocationManager.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}
