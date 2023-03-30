//
//  SwiftUIView.swift
//  
//
//  Created by 박진영 on 2023/03/28.
//

import SwiftUI
import UIKit

struct ClaudiaDetailView: View {
    @State var 포항항 = false
    // Finish 포항항
    @State var finish포항항 = false
    
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
                
                Button (action: doAnimation, label: {
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
                    
                    
                    })
                .disabled(포항항)
                
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
            
            EmitterView()
                .scaleEffect(포항항 ? 1 : 0, anchor: .top)
                .opacity(포항항 && !finish포항항 ? 1 : 0)
                .offset(y: 포항항 ? 0 : UIScreen.height / 2)
                .ignoresSafeArea()
        }
    }
    
    func doAnimation(){
        
        withAnimation(.spring()){
            
            포항항 = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            withAnimation(.easeInOut(duration: 1.5)){
                
                finish포항항 = true
            }
            // Reseting After 포항항 Finished
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4){
                
                finish포항항 = false
                포항항 = false
            }
            
        }
    }
}

struct EmitterView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        // Emitter Layer
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmiterCells()
        
        //Size and Position
        emitterLayer.emitterSize = CGSize(width: UIScreen.width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: UIScreen.width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmiterCells() -> [CAEmitterCell] {
        
        // Multiple Emmiters
        
        var emitterCells: [CAEmitterCell] = []
        
        for index in 1...12{
            
            let cell = CAEmitterCell()
            
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            cell.color = getColor().cgColor
            // New Particle Creation
            cell.birthRate = 4.5
            // Particle Existence
            cell.lifetime = 20
            // velocity
            cell.velocity = 120
            // Scale
            cell.scale = 0.05
            cell.scaleRange = 0.2
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            // Acceleration
            cell.yAcceleration = 40
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
    func getColor()->UIColor{
        let colors : [UIColor] = [.systemOrange, .systemCyan, .systemPink, .systemTeal, .systemMint, .systemGreen, .systemPurple, .systemYellow]
        
        return colors.randomElement()!
    }
    
    func getImage(index: Int)->String{
        
        if index < 4{
            return "square"
        }
        else if index > 5 && index <= 8{
            return "circle"
        }
        else{
            return"star"
        }
    }
}



struct ClaudiaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClaudiaDetailView()
    }
}

