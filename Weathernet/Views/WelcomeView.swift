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
                    .frame(height: 0)
                
                AsyncImage(url: URL(string: "https://pixabay.com/get/g90efe6dfc355c6a93b2f876c8fcdfd00da79eb5cdffc0bbbbd2ffe7173a7d6f25138c0f1be769412e2aac861fa3062af74f9f98f9ed9526fd49ef47cbf59b3ad_1280.png")) { image in
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
