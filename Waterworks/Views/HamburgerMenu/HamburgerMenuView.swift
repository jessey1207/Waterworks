//
//  HamburgerMenuView.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

struct HamburgerMenuView: View {
    @Binding var currentPage: ContentView.Page
    @Binding var isVisible: Bool
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                MenuView(isVisible: $isVisible, currentPage: $currentPage)
                    .offset(x: isVisible ? 0 : -UIScreen.main.bounds.width)
                backgroundView
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(
            Color.black.opacity(isVisible ? 0.5 : 0)
        )
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { _ in
                    withAnimation {
                        isVisible.toggle()
                    }
                }
        )
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        if isVisible {
            Rectangle()
                .foregroundColor(Color.white.opacity(0.01))
                .padding(0)
                .onTapGesture {
                    withAnimation {
                        isVisible.toggle()
                    }
            }
        }
    }
}

struct HamburgerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenuView(currentPage: .constant(.calculator), isVisible: .constant(true))
    }
}
