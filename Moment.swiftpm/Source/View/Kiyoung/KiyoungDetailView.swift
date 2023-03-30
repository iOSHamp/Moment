//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 2023/03/28.
//

import SwiftUI

struct KiyoungDetailView: View {
    @State var offsetY: CGFloat = 100
    @State var danceOff: CGFloat = 250
    @State var isOn = false
    @State var opacityOff = false
    @State var opacityMessage = false
    @State var changeOffsetX = false
    var body: some View {
        
        ZStack{
            Color(hex: 0xF9F5EA)
                .ignoresSafeArea()
           /* Rectangle()
                .foregroundColor(Color(hex: 0xFFEED0))
                .frame(width: 330, height: 200)
                .cornerRadius(20)
                .shadow(color:Color(hex: 0xccbea6) ,radius: 3)
                .offset(y:-250)
                .opacity(1)
            
            
            Text("To. Pierce")
                .offset(x:-80 , y:-320)
                .font(
                    .title
                    .weight(.black))
                
                
            Text("걱정하지마")
                .offset(x:-90,y:-255)
                .font(
                    .title
                        .weight(.black))
            Text("우리는 해낼 수 있어!              ")
                .offset(y:-220)
                .font(
                    .title
                        .weight(.black))
            
            Image("envelop")
                .frame(width: 330, height: 200)
                .cornerRadius(20)
                .shadow(color:.brown ,radius: 10)
                .offset(y:-250)
                .onTapGesture {
                    opacityOff = !opacityOff
                }
                .opacity(opacityOff ?  0.1 : 1)
                .animation(.easeIn(duration: 1.5), value: opacityOff)
            */
          
           Image(systemName: "message.badge.filled.fill")
                .foregroundStyle(.red, .green)
                .font(.system(size: 80))
                .onTapGesture {
                    opacityMessage = !opacityMessage
                }
                .opacity(opacityMessage ? 0 : 1)
                .offset(x:opacityMessage ? -100 : 0,y:-240)
                .animation(.easeOut(duration: 1.7), value: opacityMessage)
              
                

            Image(systemName: "message.fill")
                .foregroundStyle(.green)
                .font(.system(size: 80))
                .opacity(opacityMessage ? 1 : 0)
                .animation(.easeOut(duration: 1.5).delay(1.2), value: opacityMessage)
                .offset(x:-100,y:-240)
            
            Image(systemName: "bubble.right.fill")
                .foregroundStyle(.blue)
                .font(.system(size: 180))
                .opacity(opacityMessage ? 1 : 0)
                .animation(.easeOut(duration: 1.5).delay(1.4), value: opacityMessage)
                .offset(x:70,y:-240)
            
            Text("MC1 Pierce와 함께라서")
                .offset(x:70,y:-270)
                .opacity(opacityMessage ? 1 : 0)
                .animation(.easeOut(duration: 1.5).delay(1.4), value: opacityMessage)
                .font(
                    .callout
                        .weight(.black))
                .foregroundColor(.white)
            Text("너무 즐겁고 행복했어요!")
                .offset(x:65,y:-240)
                .opacity(opacityMessage ? 1 : 0)
                .animation(.easeOut(duration: 1.5).delay(1.4), value: opacityMessage)
                .font(
                    .callout
                        .weight(.black))
                .foregroundColor(.white)
            
            Text("We are Pierce!")
                .offset(y:-120)
                .font(
                    .largeTitle
                        .weight(.black))

            
            Image("presentation")
                .resizable()
                .frame(width: 300, height: 180)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 3))
                .shadow(color: .gray, radius: 15,x:10, y: 20)
                .offset(y:0)
            HStack{
        
                Image("oliver").offset(y:offsetY+30)
                Image("clau").offset(y:offsetY+20)
                Image("puppy").offset(y:offsetY)
                Image("kiyoung").offset(y:offsetY)
                Image("niko").offset(y:offsetY)
                Image("kayle").offset(y:offsetY)
                
            }
            
            HStack{
                Image("people")
                    .offset(x:120 ,y: isOn ? 230 : danceOff)
                    .onTapGesture {
                        isOn = !isOn
                    }
                    .animation(.default.repeatCount(5), value: isOn)
                
                Image("people")
                    .offset(x:-120 ,y: isOn ? 230 : danceOff)
                    .onTapGesture {
                        isOn = !isOn
                    }
                    .animation(.default.repeatCount(5), value: isOn)
            }

}
        


    }

}



struct KiyoungDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KiyoungDetailView()
    }
}
