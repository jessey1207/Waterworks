//
//  PageView.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI

struct PageView: View {
    var currentPage: ContentView.Page
    
    let savedCalculations: [SavedCalculation] = [
        .init(name: "A", userInput: .init()),
        .init(name: "B", userInput: .init()),
        .init(name: "C", userInput: .init())
    ]
    
    var body: some View {
        switch currentPage {
        case .calculator:
            GridContentView()
                .edgesIgnoringSafeArea(.top)
        case .saved, .favourites:
            List(savedCalculations) { calculation in
                NavigationLink {
                    SavedCalculationDetailView(viewModel: calculation)
                } label: {
                    Text(calculation.name)
                }
                .listStyle(.insetGrouped)
                .background(currentPage.backgroundColor.opacity(0.25))
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(currentPage: .calculator)
    }
}
