//
//  SaveGridContentModal.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI

struct SaveGridContentModal: View {
    enum Path {
        case searchLocation
        case mapDetail
    }
    
    @StateObject var manager: SearchLocationManager = .init()
    
    @State private var navigationPath: [Path] = []
    
    
    // TODO: Implement for fields below
    @State private var name: String = ""
    @State private var notes: String = ""
    
    let onSaveAction: () -> Void
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                locationInputView
            }
            .navigationDestination(for: Path.self) { path in
                switch path {
                case .searchLocation:
                    SearchLocationView(navigationPath: $navigationPath)
                        .environmentObject(manager)
                case .mapDetail:
                    MapDetailView(navigationPath: $navigationPath)
                        .environmentObject(manager)
                }
            }
            
            Button("Save") {
                onSaveAction()
            }
        }
    }
}

private extension SaveGridContentModal {
    
    @ViewBuilder
    var locationInputView: some View {
        if let placeName = manager.confirmedPlaceName, !placeName.isEmpty {
            HStack {
                Text(placeName)
                Spacer()
                NavigationLink(
                    Constants.Save.Modal.editLocation,
                    value: Path.searchLocation
                )
                .simultaneousGesture(
                    TapGesture().onEnded {
                        manager.searchText = placeName
                    }
                )
                Text(Constants.Save.Modal.remove)
                    .foregroundColor(.red)
                    .onTapGesture {
                        manager.confirmedPlaceName = nil
                    }
            }
        } else {
            // TODO: Support save wtihout location
            NavigationLink(
                Constants.Save.Modal.addLocation,
                value: Path.searchLocation
            )
        }
    }
    
}

struct SaveGridContentModal_Previews: PreviewProvider {
    static var previews: some View {
        SaveGridContentModal() {}
    }
}

