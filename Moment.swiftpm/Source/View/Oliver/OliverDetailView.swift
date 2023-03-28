

//
//  SwiftUIView.swift
//
//
//  Created by Wonil Lee on 2023/03/28.
//

import SwiftUI

struct OliverDetailView: View {
	
	// button 1 feature
	@State var heartScale: CGFloat = 1.0
	@State var heartOpacity: CGFloat = 1.0
	@State var heartDirection: [CGFloat] = [0.0, 0.0]
	
	// button 2 feature
	@State var sajangSlide: CGFloat = 0.0
	var positiveMove = 40.0
	var negativeMove = -40.0
	var timeInterval = 0.5
	
	// button 3 feature
	@State var letterY: CGFloat = 0.0
	@State var letterOpacity: CGFloat = 0.0
	var letterYValue: CGFloat = -1000
	
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
						sajangSlide = positiveMove
						DispatchQueue.main.asyncAfter(deadline: .now() + 1*timeInterval) {
							sajangSlide = negativeMove
										}
						DispatchQueue.main.asyncAfter(deadline: .now() + 2*timeInterval) {
							sajangSlide = positiveMove
										}
						DispatchQueue.main.asyncAfter(deadline: .now() + 3*timeInterval) {
							sajangSlide = negativeMove
										}
						DispatchQueue.main.asyncAfter(deadline: .now() + 4*timeInterval) {
							sajangSlide = positiveMove
										}
						DispatchQueue.main.asyncAfter(deadline: .now() + 5*timeInterval) {
							sajangSlide = negativeMove
										}
						DispatchQueue.main.asyncAfter(deadline: .now() + 6*timeInterval) {
							sajangSlide = 0.0
										}
					} label: {
						Text("②")
							.font(.title)
					}
					.buttonStyle(.borderedProminent)
					.tint(.blue)
					
					Spacer()
					
					Button {
						letterY = letterYValue
						letterOpacity = 1.0
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
						.offset(x: sajangSlide)
						.animation(.easeInOut(duration: timeInterval), value: sajangSlide)
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
			
			OliverSecretLetterView()
				.offset(y: letterY - letterYValue)
				.opacity(letterOpacity)
				.animation(.easeInOut(duration: 2.5), value: letterY)
				.animation(.linear(duration: 2.5), value: letterOpacity)
		}
		
	}
}

struct OliverDetailView_Previews: PreviewProvider {
	static var previews: some View {
		OliverDetailView()
	}
}
