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
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: 330, height: 200)
                .cornerRadius(20)
                .offset(y:-250)
                .opacity(0.1)
            
            
            Text("To. Pierce")
                .offset(x:-80 , y:-320)
                .font(
                    .title
                        .weight(.black))
            Text("걱정하지마!")
                .offset(x:-90,y:-265)
                .font(
                    .title
                        .weight(.black))
            Text("우리의 발표는 최고였으니까!")
                .offset(y:-230)
                .font(
                    .title
                        .weight(.black))
            
            
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
            
           
            Image("people")
                .offset(x:50 ,y: isOn ? 230 : danceOff)
                .onTapGesture {
                    isOn = !isOn
                }
                .animation(.default.repeatCount(5), value: isOn)
                
            Image("people")
                .offset(x:-50 ,y: isOn ? 230 : danceOff)
                .onTapGesture {
                    isOn = !isOn
                }
                .animation(.default.repeatCount(5), value: isOn)

}
        


    }

}



struct KiyoungDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KiyoungDetailView()
    }
}
