//
//  OnboardingPageView.swift
//  
//
//  Created by Aditya Saravana on 12/16/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var config: OnboardingPageConfig
    
    var image: Image {
        switch config.image {
        case .appIcon:
            return Bundle.main.appIcon ?? Image(systemName: "questionmark.app.dashed")
        case .systemIcon(name: let name):
            return Image(systemName: name)
        case .customImage(name: let name):
            return Image(name)
        }
    }
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 128, height: 128)
                .font(.system(size: 128))
                .padding()
            Text(config.title)
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 10)
            Text(config.subtitle)
                .multilineTextAlignment(.center)
                .font(.title2)
            
            if let customView = config.customView {
                customView
            }
        }
        .frame(width: config.viewWidth, height: config.viewHeight)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
        .transition(AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
        )
        .animation(.default)
    }
}

#Preview {
    OnboardingPageView(config: .init(image: .systemIcon(name: "xmark"), title: "Welcome!", subtitle: "We'll get you started in no time."))
}
