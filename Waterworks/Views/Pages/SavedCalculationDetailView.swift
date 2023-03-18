//
//  SavedCalculationDetailView.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI
import MapKit

struct SavedCalculationDetailView: View {
    let viewModel: SavedCalculation
    
    var body: some View {
        ScrollView {
            MapView(coordinates: viewModel.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            GridView(userInput: viewModel.userInput, rotated: .constant(false))
        }
    }
}

extension SavedCalculation {
    var locationCoordinate: CLLocationCoordinate2D {
        .init(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct SavedCalculationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCalculationDetailView(viewModel: .init(name: "A", userInput: .init()))
    }
}
