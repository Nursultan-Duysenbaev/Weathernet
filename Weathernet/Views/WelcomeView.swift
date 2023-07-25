//
//  WelcomeView.swift
//  Weathernet
//
//  Created by Nursultan Duysenbaev on 23/07/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack{
                Spacer()
                    .frame(height:  -30)
                
                AsyncImage(url: URL(string: "https://pixabay.com/get/g7e1bbc7313fa789fd8786778d11984ff926533c9b12863c415612547a1028f06b5658f2ba22b888d23ffe2faaa2074ff472ade647be296677e8778136ccfa80a_1280.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                } placeholder: {
                    ProgressView()
                }
            }
            VStack(spacing: 20) {
                Text("WEATHERNET")
                    .bold()
                    .font(.title)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
                    .bold()
            }
            .multilineTextAlignment(.center)
            .padding()

            
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
