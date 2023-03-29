//
//  SwiftUIView.swift
//  
//
//  Created by Wonil Lee on 2023/03/28.
//

import SwiftUI

struct OliverSecretLetterView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
			.frame(width: UIScreen.width * 0.85, height: UIScreen.width * 1.05)
			.foregroundColor(Color(red: 230/255, green: 220/255, blue: 210/255))
			.overlay(
				VStack(alignment: .center, spacing: 30){
					Text("행복 & 든든 맛집 테스형")
						.font(.title2)
					Text("우리의 테스형 첫 방문일은 \n Claudia의 생일이기도 했어요!")
						.font(.title2)
						.multilineTextAlignment(.center)
					Image("tesBroSub5")
						.resizable()
						.scaledToFill()
						.frame(width: UIScreen.width * 0.65, height: UIScreen.width * 0.65 * 0.75)
						.clipped()
						.cornerRadius(10)
					Text("")
				}
					.offset(y: 20)
				
			)
		
		
    }
}

struct OliverSecretLetterView_Previews: PreviewProvider {
    static var previews: some View {
		OliverSecretLetterView()
    }
}
