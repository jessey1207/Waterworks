//
//  MapDetailView.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/3/2023.
//

import SwiftUI

struct MapDetailView: View {
    @EnvironmentObject var manager: SearchLocationManager
    @Binding var navigationPath: [SaveGridContentModal.Path]
    
    var body: some View {
        ZStack {
            MapView()
                .environmentObject(manager)
                .ignoresSafeArea()
            
            if let place = manager.pickedPlacemark {
                confirmLocationView(
                    name: place.name ?? "",
                    locality: place.locality ?? ""
                )
            }
        }
        .onDisappear {
            manager.reset()
        }
    }
}

private extension MapDetailView {
    func confirmLocationView(name: String, locality: String) -> some View {
        VStack(spacing: 15) {
            Text(Constants.SearchLocation.Map.confirmLocation)
                .font(.title2.bold())
            HStack(spacing: 15) {
                Image(systemName: "mappin.circle.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.title3.bold())
                    Text(locality)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            
            Button {
                manager.confirmedPlaceName = manager.pickedPlacemark?.name
                navigationPath.removeLast(2)
            } label: {
                Text(Constants.SearchLocation.Map.confirmLocation)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.green)
                    }
                    .overlay(alignment: .trailing) {
                        Image(systemName: "arrow.right")
                            .font(.title3.bold())
                            .padding(.trailing)
                    }
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .ignoresSafeArea()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView(navigationPath: .constant([]))
            .environmentObject(SearchLocationManager())
    }
}
