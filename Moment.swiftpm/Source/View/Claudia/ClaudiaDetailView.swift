//
//  SwiftUIView.swift
//  
//
//  Created by 박진영 on 2023/03/28.
//

import SwiftUI

struct ClaudiaDetailView: View {
    var body: some View {
        
        ZStack {
            Color(hex: 0xF9F5EA)
                .ignoresSafeArea()
            
            VStack {
                Image("mainCard1")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300)
                    .padding(.bottom, 40)
                    .shadow(color: Color(hex: 0xCEBEA4, alpha: 1), radius: 5, x: 2, y: 4) //Shadow layer 1
                    .shadow(color: Color(hex: 0xCEBEA4, alpha: 0.5), radius: 5, x: 9, y: 9) //Shadow layer 2
                Text("Tap here👇")
                    .font(.body)
                    .foregroundColor(Color(hue: 0.388, saturation: 0.764, brightness: 0.494))
                Button {
                    print("¡Soy Claudia!")
                } label: {
                    Text("🚢 포항항ꉂꉂ(ᵔᗜᵔ*) 💙")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 230)
                        .background(Color(hex: 0x2F53A1))
                        .cornerRadius(20)
                        .shadow(color: Color(hex: 0xCEBEA4, alpha: 1), radius: 5, x: 2, y: 4) //Shadow layer 1
                        .shadow(color: Color(hex: 0xCEBEA4, alpha: 0.5), radius: 5, x: 9, y: 9) //Shadow layer 2
                    
                    
                    }
                }
            ZStack {
                Image("clauSticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:130)
                    .position(x: 355, y: 180)
                    .rotationEffect(.degrees(-10))
                Image("kayleSticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .position(x: 85, y: 480)
                    .rotationEffect(.degrees(10))
                Image("oliverSticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:70)
                    .position(x: 260, y: 110)
                    .rotationEffect(.degrees(-10))
                Image("nikoSticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:110)
                    .position(x: 330, y: 370)
                    .rotationEffect(.degrees(10))
                Image("puppySticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:130)
                    .position(x: 140, y: 75)
                    .rotationEffect(.degrees(-10))
                Image("kiyoungSticker")
                    .resizable()
                    .scaledToFit()
                    .frame(width:130)
                    .position(x: 280, y: 500)
                    .rotationEffect(.degrees(10))
            }
        }
        

    }
}

struct ClaudiaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClaudiaDetailView()
    }
}
