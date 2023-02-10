//
//  MenuView.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

struct MenuView: View {
    @Binding var isVisible: Bool
    @Binding var currentPage: ContentView.Page
    
    private let allPages = ContentView.Page.allCases
    
    var body: some View {
        VStack(spacing: 32) {
            ForEach(allPages) { page in
                makeButton(forPage: page)
            }
            Spacer()
        }
        .padding(35)
        .background(Color.white.opacity(0.9))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func makeButton(forPage page: ContentView.Page) -> some View {
        Button {
            withAnimation {
                isVisible.toggle()
            }
            currentPage = page
        } label: {
            VStack(spacing: 8) {
                page.buttonImage
                    .foregroundColor(.brownPrimary)
                    .padding(12)
                    .background(Color.bronze.opacity(0.2))
                    .cornerRadius(Constants.HamburgerMenu.ItemButton.cornerRadius)
                Text(page.name)
                    .foregroundColor(.brownPrimary)
                    .font(.captionRegular)
            }
        }
        .frame(height: Constants.HamburgerMenu.ItemButton.size)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isVisible: .constant(true), currentPage: .constant(.home))
    }
}
