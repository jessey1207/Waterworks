//
//  PageView.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI

struct PageView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.currentPage {
        case .calculator:
            GridContentView()
                .edgesIgnoringSafeArea(.top)
        case .saved:
            List {
                if !viewModel.favouritedConfigurations.isEmpty {
                    savedListSection(
                        configurations: viewModel.favouritedConfigurations,
                        headerTitle: Constants.Save.FavouriteButton.listName
                    )
                }
                if !viewModel.unfavouritedConfigurations.isEmpty {
                    // Only show "Others" title if there is favourites
                    savedListSection(
                        configurations: viewModel.unfavouritedConfigurations,
                        headerTitle: viewModel.favouritedConfigurations.isEmpty
                        ? Constants.Save.Button.listNameSaved
                        : Constants.Save.Button.listNameOthers
                    )
                }
            }
            .listStyle(.insetGrouped)
            .background(viewModel.currentPage.backgroundColor.opacity(0.25))
            .onAppear {
                viewModel.onAppearSavedPage()
            }
        case .favourites:
            List {
                if !viewModel.favouritedConfigurations.isEmpty {
                    savedListSection(
                        configurations: viewModel.favouritedConfigurations,
                        headerTitle: Constants.Save.FavouriteButton.listName
                    )
                }
            }
            .listStyle(.insetGrouped)
            .background(viewModel.currentPage.backgroundColor.opacity(0.25))
            .onAppear {
                viewModel.onAppearSavedPage()
            }
        }
    }
}

private extension PageView {
    func savedListSection(
        configurations: [SavedConfiguration],
        headerTitle: String
    ) -> some View {
        Section {
            ForEach(configurations) { configuration in
                NavigationLink {
                    SavedConfigurationDetailView(configuration: configuration) {
                        viewModel.onDelete(configuration: configuration)
                    }
                } label: {
                    savedListRowView(for: configuration)
                }
            }
            .onDelete { indexSet in
                viewModel.onDelete(indexSet: indexSet)
            }
        } header: {
            savedListHeaderView(title: headerTitle)
        }
    }
    
    func savedListHeaderView(title: String) -> some View {
        Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
    }
    
    func savedListRowView(for configuration: SavedConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(configuration.name)
            if let placeName = configuration.placeName {
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                    Text(placeName)
                }
                .foregroundColor(.gray)
                .font(.caption)
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(viewModel: .init(currentPage: .saved))
    }
}
