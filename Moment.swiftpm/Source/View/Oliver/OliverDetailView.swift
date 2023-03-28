

//
//  SwiftUIView.swift
//
//
//  Created by Wonil Lee on 2023/03/28.
//

import SwiftUI

struct OliverDetailView: View {
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Button {
						
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
				}
				Text("")
					.frame(height: 100)
			}
		}
		
	}
}

struct OliverDetailView_Previews: PreviewProvider {
	static var previews: some View {
		OliverDetailView()
	}
}
