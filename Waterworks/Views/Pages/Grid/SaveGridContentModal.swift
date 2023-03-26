//
//  SaveGridContentModal.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI
import MapKit

struct SaveGridContentModal: View {
    /// Save action with parameters: name, location, place name, notes, grid user input
    typealias OnSaveCompletion = (String, CLLocation?, String?, String, GridUserInput) -> Void
    
    let onSaveAction: OnSaveCompletion
    let onDismissAction: () -> Void
    
    @StateObject private var manager: SearchLocationManager
    @State private var navigationPath: [Path] = []
    @State private var inputError: InputError?
    
    // Inputs
    @ObservedObject private var gridUserInput: GridUserInput
    @FocusState private var focusedField: Field?
    @State private var isVisibleGridUserInputFields: Bool
    @State private var name: String = ""
    @State private var notes: String = ""
    
    init(
        manager: SearchLocationManager = .init(),
        isVisibleGridUserInputFields: Bool = false,
        gridUserInput: GridUserInput,
        name: String = "",
        notes: String = "",
        onSaveAction: @escaping OnSaveCompletion,
        onDismissAction: @escaping () -> Void
    ) {
        self._manager = .init(wrappedValue: manager)
        self.isVisibleGridUserInputFields = isVisibleGridUserInputFields
        self.gridUserInput = gridUserInput
        self.name = name
        self.notes = notes
        self.onSaveAction = onSaveAction
        self.onDismissAction = onDismissAction
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                fields
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
                        inputError = nil
                    }
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
                    inputError = .emptyName
                } else if !isVisibleGridUserInputFields,
                            LocalStorage.savedConfigurations.contains(where: { $0.name == name }) {
                    // Only check when saving a new config i.e grid user input fields not visible
                    focusedField = nil
                    inputError = .nameAlreadyExists
                } else {
                    onSaveAction(
                        name,
                        manager.confirmedPlacemark?.location,
                        manager.confirmedPlacemark?.name,
                        notes,
                        gridUserInput
                    )
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
    
    var fields: some View {
        VStack(alignment: .leading, spacing: 20) {
            // MARK: Name
            textField(for: .name, text: $name)
            
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
            textField(for: .notes, text: $notes)
            
            // MARK: Grid
            gridRelatedFields
        }
    }
    
    @ViewBuilder
    var gridRelatedFields: some View {
        if isVisibleGridUserInputFields {
            pickerField(
                for: .gridLuck,
                binding: $gridUserInput.luck,
                labelString: String(gridUserInput.luck.rawValue)
            ) {
                ForEach(Luck.allCases) {
                    Text(String($0.rawValue))
                }
            }
            pickerField(
                for: .gridLocation,
                binding: $gridUserInput.location,
                labelString: String(gridUserInput.location.rawValue)
            ) {
                ForEach(Location.allCases) {
                    Text(String($0.rawValue))
                }
            }
            pickerField(
                for: .gridYear,
                binding: $gridUserInput.year.number,
                labelString: String(gridUserInput.year.number)
            ) {
                ForEach(Array(Field.gridYear.getYearRange()), id: \.self) {
                    Text(String($0))
                }
            }
        }
    }
    
    @ViewBuilder
    var locationFieldTextView: some View {
        if let placeName = manager.confirmedPlacemark?.name, !placeName.isEmpty {
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
                    manager.confirmedPlacemark = nil
                }
        } else {
            NavigationLink(
                Constants.Save.Modal.Fields.Location.add,
                value: Path.searchLocation
            )
            Spacer()
        }
    }
    
    func textField(for field: Field, text: Binding<String>) -> some View {
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
            if field.isMandatory, let inputError {
                Text(inputError.message)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
    
    @ViewBuilder
    func pickerField<Selection: Hashable>(
        for field: Field,
        binding: Binding<Selection>,
        labelString: String,
        @ViewBuilder buildOptions: () -> ForEach<[Selection], Selection, Text>
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(field.title)
                .font(.title3)
                .fontWeight(.medium)
            Menu {
                Picker(selection: binding) {
                    buildOptions()
                } label: {}
            } label: {
                Text(labelString)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.gray)
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
    
    enum InputError {
        case emptyName
        case nameAlreadyExists
        
        var message: String {
            switch self {
            case .emptyName:
                return Constants.Save.Modal.Fields.Name.emptyNameError
            case .nameAlreadyExists:
                return Constants.Save.Modal.Fields.Name.nameExistsError
            }
        }
    }
    
    enum Field {
        case name
        case notes
        case location
        case gridLuck
        case gridLocation
        case gridYear
        
        var title: String {
            switch self {
            case .name:
                return Constants.Save.Modal.Fields.Name.title
            case .notes:
                return Constants.Save.Modal.Fields.Notes.title
            case .location:
                return Constants.Save.Modal.Fields.Location.title
            case .gridLuck:
                return Constants.ChinesePicker.luckText
            case .gridLocation:
                return Constants.ChinesePicker.locationText
            case .gridYear:
                return Constants.ChinesePicker.yearText
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
            case .gridLuck, .gridLocation, .gridYear:
                return ""
            }
        }
        
        var placeholder: String {
            switch self {
            case .name:
                return Constants.Save.Modal.Fields.Name.placeholder
            case .notes:
                return Constants.Save.Modal.Fields.Notes.placeholder
            case .location, .gridLuck, .gridLocation, .gridYear:
                return ""
            }
        }
        
        var isMandatory: Bool {
            self == .name
        }
        
        // MARK: Helpers
        
        func getYearRange() -> ClosedRange<Int> {
            let currentDate = Date()
        
            var dateComponents = DateComponents()
            dateComponents.year = 200
            let futureDate = Calendar.current.date(byAdding: dateComponents, to: currentDate) ?? currentDate

            let currentYear = Calendar.current.component(.year, from: currentDate)
            let futureYear = Calendar.current.component(.year, from: futureDate)
            return currentYear ... futureYear
        }
    }
}

struct SaveGridContentModal_Previews: PreviewProvider {
    static var previews: some View {
        SaveGridContentModal(
            gridUserInput: .init(),
            onSaveAction: { _, _, _, _, _ in },
            onDismissAction: {}
        )
    }
}

