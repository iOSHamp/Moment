//
//  SwiftUIView.swift
//  
//
//  Created by 박진영 on 2023/03/28.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        ZStack {
            Color(hex: 0xF9F5EA)
                .ignoresSafeArea()
            
            VStack {
                Image("mainCard2")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300)
                Text("Push here👇")
                    .font(.body)
                    .foregroundColor(Color(hue: 0.388, saturation: 0.764, brightness: 0.494))
                Button {
                    print("¡Soy Claudia!")
                } label: {
                    Text("¡Hola!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 230)
                        .background(Color(red: 0.21568627450980393, green: 0.5882352941176471, blue: 0.43529411764705883))
                        .cornerRadius(20)
                }
            }
        }
        

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
