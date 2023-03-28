

//
//  SwiftUIView.swift
//
//
//  Created by Wonil Lee on 2023/03/28.
//

import SwiftUI

struct OliverDetailView: View {
	@State var heartScale: CGFloat = 1.0
	@State var heartOpacity: CGFloat = 1.0
	@State var heartDirection: [CGFloat] = [0.0, 0.0]
	
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Button {
						withAnimation(.linear(duration: 5.0)) {
							heartScale = 10.0
							heartOpacity = 0.0
							heartDirection = [-10, -200]
						}
					} label: {
						Text("①")
							.font(.title)
					}
					.buttonStyle(.borderedProminent)
					.tint(.red)
					
					Spacer()
					
					Button {
						
					} label: {
						Text("②")
							.font(.title)
					}
					.buttonStyle(.borderedProminent)
					.tint(.blue)
					
					Spacer()
					
					Button {
						
					} label: {
						Text("③")
							.font(.title)
					}
					.buttonStyle(.borderedProminent)
					.tint(.green)
				} // buttons
				.padding(.horizontal, 70)
				Text("")
					.frame(height: 30)
				ZStack {
					Image("tesBroSub3")
					Image("tesBroSub1")
						.resizable()
						.scaledToFit()
						.frame(width: UIScreen.width)
						.offset(y: 300)
						.scaledToFit()
				} // images
				Text("")
					.frame(height: 100)
				
			}
			
			Image(systemName: "heart.fill")
				.font(.system(size: 160))
				.offset(x: 10 + heartDirection[0], y: -100 + heartDirection[1])
				.foregroundColor(.pink)
				.scaleEffect(heartScale)
				.opacity(heartOpacity)
		}
		
	}
}

struct OliverDetailView_Previews: PreviewProvider {
	static var previews: some View {
		OliverDetailView()
	}
}
