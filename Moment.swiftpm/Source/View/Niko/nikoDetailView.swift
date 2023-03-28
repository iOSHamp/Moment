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
            VStack{
                Image("mainCard1")
                Button {
                   print("그 날의 추억")
                } label: {
                    Text("웰빙 아울렛")
                }
                
            }
        }
    }
        
    
    struct nikoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            nikoDetailView()
        }
    }
}
