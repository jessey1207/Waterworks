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
                // MARK: Favourites
                Section {
                    // TODO: -
                } header: {
                    savedListHeaderView(title: "Favourites")
                }
                
                // MARK: Others
                Section {
                    ForEach(viewModel.savedConfigurations) { configuration in
                        NavigationLink {
                            SavedConfigurationDetailView(configuration: configuration)
                        } label: {
                            savedListRowView(for: configuration)
                        }
                    }
                } header: {
                    savedListHeaderView(title: "Others")
                }
            }
            .listStyle(.insetGrouped)
            .background(viewModel.currentPage.backgroundColor.opacity(0.25))
            .onAppear {
                viewModel.onAppearSavedPage()
            }
        case .favourites:
            EmptyView()
        }
    }
}

private extension PageView {
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
