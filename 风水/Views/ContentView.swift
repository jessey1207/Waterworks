//
//  ContentView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userInput = UserInput()
    @State var hideShareButton: Bool = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                Spacer()
                PickerView(userInput: userInput)
//                Image(systemName: "arrowtriangle.up.fill")
//                    .font(.system(size: 24))
                GridView(userInput: userInput)
                ShareButton(action: showShareSheet)
                    .opacity(hideShareButton ? 0 : 1)
                Spacer()
            }
            .scrollInLandscapeMode()
            .ignoresSafeArea(.keyboard)
        }
    }
    
    private func showShareSheet() {
        let image = takeSnapshot()
        let vc = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController?
            .present(vc, animated: true, completion: nil)
    }

    private func takeSnapshot() -> UIImage {
        hideShareButton = true
        let image = body.snapshot()
        hideShareButton = false
        return image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
