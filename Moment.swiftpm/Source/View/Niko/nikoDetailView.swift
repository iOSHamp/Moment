//
//  SwiftUIView.swift
//  
//
//  Created by Niko Yejin Kim on 2023/03/28.
//

import SwiftUI

struct nikoDetailView: View {
    
    var body: some View {
        
        
        
        ZStack{AngularGradient(gradient: Gradient(colors:[.red,.orange,.yellow,.green,.blue,.purple]), center: .center)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("mainCard1")
                Text("웰빙 아울렛.. 그날의 추억")
                    .offset(y:-65)
                Button {
                    print("Let's go")
                }
            label: {
                Text("What is Well-being?")
                    .tint(.white)
            }
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        
                        Image("wellbeing")
                        Image("statue")
                        Image("cafe")
                        Image("gate")
                        Image("manequin")
                        Image("tops")
                        Image("sign")
                    }
                }
            }
        }
    }
    
}
        
    
    struct nikoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            nikoDetailView()
        }
    }

