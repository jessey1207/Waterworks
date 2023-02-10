//
//  ContentView.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentPage: Page = .home
    @State var isVisibleHamburgerMenu: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                PageView(currentPage: currentPage)
                    .edgesIgnoringSafeArea(.top)
                HamburgerMenuView(currentPage: $currentPage, isVisible: $isVisibleHamburgerMenu)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: navBarButton)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var navBarButton: some View {
        Button {
            withAnimation{
                isVisibleHamburgerMenu.toggle()
            }
        } label: {
            Image(
                systemName: isVisibleHamburgerMenu
                ?  Constants.HamburgerMenu.Button.activeImageName
                : Constants.HamburgerMenu.Button.inactiveImageName
            )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.HamburgerMenu.Button.size, height: Constants.HamburgerMenu.Button.size)
                .padding(.top, Constants.HamburgerMenu.Button.padding)
                .padding(.leading, Constants.HamburgerMenu.Button.padding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
