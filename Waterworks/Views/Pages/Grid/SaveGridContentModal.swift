//
//  SaveGridContentModal.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI
import MapKit

struct SaveGridContentModal: View {
    let onSaveAction: (String, CLLocation?, String) -> Void
    let onDismissAction: () -> Void
    
    @StateObject var manager: SearchLocationManager = .init()
    
    @FocusState private var focusedField: Field?
    @State private var navigationPath: [Path] = []
    @State private var name: String = ""
    @State private var notes: String = ""
    @State private var isVisibleInputError: Bool = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            inputFields
                .interactiveDismissDisabled()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(20)
                .toolbar {
                    toolbarContent
                }
                .navigationTitle(Constants.Save.Modal.navigationTitle)
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: Path.self) { path in
                    switch path {
                    case .searchLocation:
                        SearchLocationView(navigationPath: $navigationPath)
                            .environmentObject(manager)
                            .navigationBarTitleDisplayMode(.inline)
                    case .mapDetail:
                        MapDetailView(navigationPath: $navigationPath)
                            .environmentObject(manager)
                    }
                }
                .onChange(of: name) { _ in
                    isVisibleInputError = false
                }
        }
    }
}

private extension SaveGridContentModal {
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(Constants.Save.Modal.cancel) {
                onDismissAction()
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(Constants.Save.Modal.save) {
                if name.isEmpty {
                    focusedField = nil
                    isVisibleInputError = true
                } else {
                    onSaveAction(name, manager.pickedPlacemark?.location, notes)
                }
            }
        }
        ToolbarItem(placement: .keyboard) {
            Button(Constants.Save.Modal.done) {
                focusedField = nil
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    var inputFields: some View {
        VStack(alignment: .leading, spacing: 20) {
            // MARK: Name
            inputField(field: .name, text: $name)
            
            // MARK: Location
            VStack(alignment: .leading, spacing: 10) {
                Text(Field.location.title)
                    .font(.title3)
                    .fontWeight(.medium)
                HStack(spacing: 10) {
                    Image(systemName: Field.location.imageName)
                        .foregroundColor(.gray)
                    locationFieldTextView
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .strokeBorder(.gray)
                }
            }
            
            // MARK: Notes
            inputField(field: .notes, text: $notes)
        }
    }
    
    @ViewBuilder
    var locationFieldTextView: some View {
        if let placeName = manager.confirmedPlaceName, !placeName.isEmpty {
            Text(placeName)
            Spacer()
            NavigationLink(
                Constants.Save.Modal.Fields.Location.edit,
                value: Path.searchLocation
            )
            .simultaneousGesture(
                TapGesture().onEnded {
                    manager.searchText = placeName
                }
            )
            Text(Constants.Save.Modal.Fields.Location.remove)
                .foregroundColor(.red)
                .onTapGesture {
                    manager.confirmedPlaceName = nil
                }
        } else {
            NavigationLink(
                Constants.Save.Modal.Fields.Location.add,
                value: Path.searchLocation
            )
            Spacer()
        }
    }
    
    func inputField(field: Field, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(field.title)
                .font(.title3)
                .fontWeight(.medium)
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: field.imageName)
                    .foregroundColor(.gray)
                TextField(field.placeholder, text: text, axis: .vertical)
                    .focused($focusedField, equals: field)
                Image(systemName: "x.circle.fill")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        text.wrappedValue = ""
                    }
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.gray)
            }
            .padding(.vertical, 10)
            if field.isMandatory, isVisibleInputError {
                Text(Constants.Save.Modal.Fields.Name.errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

// MARK: - Types

extension SaveGridContentModal {
    enum Path {
        case searchLocation
        case mapDetail
    }
    
    enum Field {
        case name
        case notes
        case location
        
        var title: String {
            switch self {
            case .name:
                return Constants.Save.Modal.Fields.Name.title
            case .notes:
                return Constants.Save.Modal.Fields.Notes.title
            case .location:
                return Constants.Save.Modal.Fields.Location.title
            }
        }
        
        var imageName: String {
            switch self {
            case .name:
                return Constants.Save.Modal.Fields.Name.imageName
            case .notes:
                return Constants.Save.Modal.Fields.Notes.imageName
            case .location:
                return Constants.Save.Modal.Fields.Location.imageName
            }
        }
        
        var placeholder: String {
            switch self {
            case .name:
                return Constants.Save.Modal.Fields.Name.placeholder
            case .notes:
                return Constants.Save.Modal.Fields.Notes.placeholder
            case .location:
                return ""
            }
        }
        
        var isMandatory: Bool {
            self == .name
        }
    }
}

struct SaveGridContentModal_Previews: PreviewProvider {
    static var previews: some View {
        SaveGridContentModal(
            onSaveAction: { _, _, _ in },
            onDismissAction: {}
        )
    }
}

