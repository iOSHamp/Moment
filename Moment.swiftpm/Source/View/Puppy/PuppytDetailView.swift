//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/03/28.
//

import SwiftUI

struct PuppyDetailView: View {
    
    @State var open = false
    @State var offset: CGFloat = -UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            
            Button {
                self.offset = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7 ){
                    self.open.toggle()
                }

            } label: {
                ZStack{
                    Image("barbet")
                    VStack{
                        ZStack {
                
                            VStack{
                                Text("우리의 이야기를")
                                Text("클릭해서 열어주세요")
                                
                            }
                        }
                    }
                    .foregroundColor(.black)
                }.opacity(self.offset == -UIScreen.main.bounds.height ? 1.0 : 0)
            }

            
            ZStack {
                
                LinearGradient(gradient: .init(colors: [.white, .purple, .white]), startPoint: .top, endPoint: .bottom)
                Image("letter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)

                VStack {
                  
                    HStack {
                        Spacer()
                        Button {
                            self.open.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6 ){
                                self.offset = -UIScreen.main.bounds.height
                            }

                            
                            
                        } label: {
                            Image(systemName: "xmark.circle").font(.title)
                        }.foregroundColor(.black)
                        
                    }.padding()

                    Spacer()
                }
            }.cornerRadius(25)
                .padding()
                .offset(y: self.offset)
                .rotation3DEffect(.init(degrees: self.open ? 0 : 55), axis: (x: self.open ? 0 : 1.0, y: 0, z: 0))
                .opacity(self.offset == -UIScreen.main.bounds.height ? 0 : 1.0)
        }.animation(Animation.easeOut(duration: 0.5))

    }
}

struct PuppyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyDetailView()
    }
}
