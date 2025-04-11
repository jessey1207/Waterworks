//
//  SavedConfigurationDetailView.swift
//  Waterworks
//
//  Created by Jessey Fung on 25/3/2023.
//

import SwiftUI

struct SavedConfigurationDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var configuration: SavedConfiguration
    @State private var isPresentedDeleteAlert: Bool = false
    @State private var isPresentedEditSheet: Bool = false
    
    private let searchLocationManager: SearchLocationManager = .init()
    private let onDeleteAction: () -> Void
    
    init(configuration: SavedConfiguration, onDeleteAction: @escaping () -> Void) {
        self._configuration = .init(wrappedValue: configuration)
        self.onDeleteAction = onDeleteAction
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
                Button {
                    isPresentedDeleteAlert = true
                } label: {
                    Text(Constants.Delete.title)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                }

            }
            .padding()
        }
        .navigationTitle(configuration.name)
        .toolbar {
            toolbar
        }
        .sheet(isPresented: $isPresentedEditSheet) {
            editSheet
        }
        .alert(isPresented: $isPresentedDeleteAlert) {
            Alert(
                title: Text(Constants.Delete.Alert.title),
                message:  Text(Constants.Delete.Alert.message),
                primaryButton: .cancel(Text(Constants.Delete.Alert.Buttons.no)),
                secondaryButton: .destructive(Text(Constants.Delete.Alert.Buttons.yes)) {
                    onDelete()
                }
            )
        }
    }
}

private extension SavedConfigurationDetailView {
    @ToolbarContentBuilder
    var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            favouriteButton
            editButton
        }
    }
    
    var favouriteButton: some View {
        Button {
            withAnimation {
                onTapFavouriteButton()
            }
        } label: {
            Image(
                systemName: configuration.isFavourited
                ? Constants.Save.FavouriteButton.favouritedImageName
                : Constants.Save.FavouriteButton.unfavouritedImageName
            )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
                width: Constants.Save.FavouriteButton.size,
                height: Constants.Save.FavouriteButton.size
            )
        }
    }
    
    var editButton: some View {
        Button(Constants.Save.Modal.edit) {
            searchLocationManager.setConfirmedLocation(configuration.location)
            isPresentedEditSheet = true
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
                isPresentedEditSheet = false
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
        isPresentedEditSheet = false
    }
    
    func onTapFavouriteButton() {
        let updatedConfiguration = configuration.toggledFavouriteConfiguration
        LocalStorage.savedConfigurations.removeAll(where: { $0.name == configuration.name })
        LocalStorage.savedConfigurations.append(updatedConfiguration)
        configuration = updatedConfiguration
        searchLocationManager.setPickedLocation(updatedConfiguration.location)
    }
    
    func onDelete() {
        onDeleteAction()
        dismiss()
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
        ) {}
    }
}
