//
//  CompassView.swift
//  Waterworks
//
//  Created by Jessey Fung on 25/6/2023.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.gray.opacity(0.1)
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(
                        width: Constants.Compass.circleSize,
                        height: Constants.Compass.circleSize
                    )
                
                buildViewFor(.top, point: viewModel.topPoint, proxy: proxy)
                buildViewFor(.topLeft, point: viewModel.topLeftPoint, proxy: proxy)
                buildViewFor(.left, point: viewModel.leftPoint, proxy: proxy)
                buildViewFor(.bottomLeft, point: viewModel.bottomLeftPoint, proxy: proxy)
                buildViewFor(.bottom, point: viewModel.bottomPoint, proxy: proxy)
                buildViewFor(.bottomRight, point: viewModel.bottomRightPoint, proxy: proxy)
                buildViewFor(.right, point: viewModel.rightPoint, proxy: proxy)
                buildViewFor(.topRight, point: viewModel.topRightPoint, proxy: proxy)
            }
            .animation(.easeInOut(duration: 0.5), value: viewModel)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
    }
    
    @ViewBuilder
    func buildViewFor(
        _ arrow: Arrow,
        point: CardinalPoint,
        proxy: GeometryProxy
    ) -> some View {
        Image(systemName: "arrow.up")
            .imageScale(Constants.Compass.imageScale)
            .rotationEffect(arrow.compassRotationEffect)
            .position(arrow.compassImagePosition(proxy: proxy))
        Text(point.chineseTranslation)
            .font(.system(size: Constants.Compass.fontSize))
            .position(arrow.compassLabelPosition(proxy: proxy))
        
    }
}

private extension Arrow {
    var compassRotationEffect: Angle {
        switch self {
        case .topLeft:
            return .degrees(-45)
        case .top:
            return .degrees(0)
        case .topRight:
            return .degrees(45)
        case .left:
            return .degrees(-90)
        case .right:
            return .degrees(90)
        case .bottomLeft:
            return .degrees(-45-90)
        case .bottom:
            return .degrees(180)
        case .bottomRight:
            return .degrees(45+90)
        }
    }
    
    func compassImagePosition(proxy: GeometryProxy) -> CGPoint {
        switch self {
        case .topLeft:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetCorner
            )
        case .top:
            return .init(
                x: proxy.size.width / 2,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetAxis
            )
        case .topRight:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetCorner
            )
        case .left:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.circleOffsetAxis,
                y: proxy.size.height / 2
            )
        case .right:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.circleOffsetAxis,
                y: proxy.size.height / 2
            )
        case .bottomLeft:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetCorner
            )
        case .bottom:
            return .init(
                x: proxy.size.width / 2,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetAxis
            )
        case .bottomRight:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetCorner
            )
        }
    }
    
    func compassLabelPosition(proxy: GeometryProxy) -> CGPoint {
        switch self {
        case .topLeft:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.textOffsetCorner - Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetCorner - Constants.Compass.circleOffsetCorner
            )
        case .top:
            return .init(
                x: proxy.size.width / 2,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetAxis - Constants.Compass.textOffsetAxis
            )
        case .topRight:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.textOffsetCorner + Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 - Constants.Compass.circleOffsetCorner - Constants.Compass.circleOffsetCorner
            )
        case .left:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.circleOffsetAxis - Constants.Compass.textOffsetAxis,
                y: proxy.size.height / 2
            )
        case .right:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.circleOffsetAxis + Constants.Compass.textOffsetAxis,
                y: proxy.size.height / 2
            )
        case .bottomLeft:
            return .init(
                x: proxy.size.width / 2 - Constants.Compass.textOffsetCorner - Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetCorner + Constants.Compass.circleOffsetCorner
            )
        case .bottom:
            return .init(
                x: proxy.size.width / 2,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetAxis + Constants.Compass.textOffsetAxis
            )
        case .bottomRight:
            return .init(
                x: proxy.size.width / 2 + Constants.Compass.textOffsetCorner + Constants.Compass.circleOffsetCorner,
                y: proxy.size.height / 2 + Constants.Compass.circleOffsetCorner + Constants.Compass.circleOffsetCorner
            )
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView(viewModel: .init(userInput: .init(), rotatedPoint: .E))
    }
}
