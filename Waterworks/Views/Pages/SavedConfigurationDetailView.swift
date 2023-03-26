//
//  SavedConfigurationDetailView.swift
//  Waterworks
//
//  Created by Jessey Fung on 25/3/2023.
//

import SwiftUI

struct SavedConfigurationDetailView: View {
    @State var configuration: SavedConfiguration
    
    @State private var isVisibleEditSheet: Bool = false
    private let searchLocationManager: SearchLocationManager = .init()
    
    init(configuration: SavedConfiguration) {
        self.configuration = configuration
        searchLocationManager.setPickedLocation(configuration.location)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: Map view if there is a location saved
                if configuration.location != nil {
                    mapView
                }
                // MARK: Saved grid
                gridContentView
                // MARK: Notes if there are notes saved
                if !configuration.notes.isEmpty {
                    notesView
                }
            }
            .padding()
        }
        .navigationTitle(configuration.name)
        .toolbar {
            editButton
        }
        .sheet(isPresented: $isVisibleEditSheet) {
            editSheet
        }
    }
}

private extension SavedConfigurationDetailView {
    @ToolbarContentBuilder
    var editButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(Constants.Save.Modal.edit) {
                searchLocationManager.setConfirmedLocation(configuration.location)
                isVisibleEditSheet = true
            }
        }
    }
    
    var mapView: some View {
        MapView()
            .environmentObject(searchLocationManager)
            .frame(height: 250)
            .cornerRadius(16)
    }
    
    var gridContentView: some View {
        VStack {
            GridContentView(
                userInput: configuration.userInput,
                isRotated: false,
                mode: .view
            )
        }
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.custom(.bronzeBackground).opacity(0.35))
        }
    }
    
    var notesView: some View {
        VStack(alignment: .leading) {
            Text(Constants.Save.Modal.Fields.Notes.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
            Text(configuration.notes)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray.opacity(0.08))
                }
        }
    }
    
    var editSheet: some View {
        SaveGridContentModal(
            manager: searchLocationManager,
            isVisibleGridUserInputFields: true,
            gridUserInput: configuration.userInput,
            name: configuration.name,
            notes: configuration.notes,
            onSaveAction: { name, location, placeName, notes, gridUserInput in
                onSave(newConfiguration: .init(
                    name: name,
                    userInput: gridUserInput,
                    location: location,
                    placeName: placeName,
                    notes: notes
                ))
            },
            onDismissAction: {
                isVisibleEditSheet = false
            }
        )
    }
    
    func onSave(newConfiguration: SavedConfiguration) {
        // MARK: Remove current saved configuration
        LocalStorage.savedConfigurations.removeAll(where: { $0.name == configuration.name })
        // MARK: Save new
        LocalStorage.savedConfigurations.append(newConfiguration)
        // Update view
        configuration = newConfiguration
        searchLocationManager.setPickedLocation(newConfiguration.location)
        isVisibleEditSheet = false
    }
}

struct SavedConfigurationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SavedConfigurationDetailView(
            configuration: .init(
                name: "A",
                userInput: .init(luck: .five, location: .丙),
                location: .init(latitude: 300, longitude: 300),
                placeName: "Place",
                notes: "note"
            )
        )
    }
}
