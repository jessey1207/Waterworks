//
//  PageView.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

struct PageView: View {
    var currentPage: ContentView.Page
    
    private static let pageTitleID: String = "pageTitleID"
    
    var body: some View {
        if currentPage == .calculator {
            GridContentView()
                .edgesIgnoringSafeArea(.top)
        } else {
            ZStack(alignment: .leading) {
                currentPage.backgroundColor.opacity(0.25)
                    .edgesIgnoringSafeArea([.top, .bottom])
                ScrollViewReader { proxy in
                    ScrollView {
                        scrollContent
                            .onChange(of: currentPage) { _ in
                                withAnimation {
                                    proxy.scrollTo(Self.pageTitleID, anchor: .bottom)
                                }
                            }
                    }
                }
            }
        }
    }
    
    // TODO: Fix up this layout
    
    private var scrollContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(currentPage.pageTitle)
                .font(.custom(.title))
                .multilineTextAlignment(.leading)
                .id(Self.pageTitleID)
            Text(currentPage.description)
                .font(.custom(.bodySecondary))
                .multilineTextAlignment(.leading)
            Text(currentPage.unorderedListTitle)
                .font(.custom(.bodySecondary))
                .multilineTextAlignment(.leading)
            VStack(alignment: .leading, spacing: 10) {
                ForEach(currentPage.unorderedList, id: \.self) { listItem in
                    HStack(alignment: .top, spacing: 4) {
                        Text("∙")
                        Text(listItem)
                    }
                    .font(.custom(.bodySecondary))
                    .multilineTextAlignment(.leading)
                    
                }
            }
            Text(currentPage.conclusion)
                .font(.custom(.bodySecondary))
                .multilineTextAlignment(.leading)
        }
        .foregroundColor(currentPage.textColor)
        .padding(25)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(currentPage: .home)
    }
}
