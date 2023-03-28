//
//  SwiftUIView.swift
//  
//
//  Created by Niko Yejin Kim on 2023/03/28.
//

import SwiftUI

struct nikoDetailView: View {
    
    var body: some View {
        ScrollView{
            ZStack{
              
                VStack{
                    
                    Image("mainCard1")
                    Button {
                        print("Let's go")
                        }
                label: {
                        Text("What is Well-being?")
                            .tint(.red)
                    }
                    
                    Image("wellbeing")
                    Image("statue")
                    Image("cafe")
                    Image("gate")
                    Image("manequin")
                    Image("tops")
                    Image("sign")
                    
                    
                }
                Text("웰빙 아울렛 그날의 추억")
                    .offset(y:-150)
            }
        }
    }
        
    
    struct nikoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            nikoDetailView()
        }
    }
}
