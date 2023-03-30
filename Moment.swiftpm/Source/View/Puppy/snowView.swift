//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/03/28.
//

import SwiftUI

struct snowView: UIViewRepresentable {
    
    let imageName: String
    let xPosition: Int
    
    func makeUIView(context: Context) -> some UIView {
        
        
        let screenSize = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: CGFloat(xPosition), y: -40, width: screenSize.width, height: screenSize.height))
        view.layer.masksToBounds = true
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = CGRect(x: CGFloat(xPosition), y: -40, width: view.frame.width, height: view.frame.height)
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterPosition = CGPoint.zero
        
        emitterLayer.emitterMode = .surface
        emitterLayer.renderMode = .oldestLast
        
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 10
        cell.velocity = 100
        cell.emissionRange = CGFloat.pi
        cell.scale = 0.1
        
        cell.contents = UIImage(named: imageName)?.resized(to: CGSize(width: 90, height: 90)).cgImage
        
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
