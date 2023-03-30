//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/03/27.
//

import SwiftUI

struct DetailView: View {
    
    var photo: Photo // Photo 타입의 사진
    @Binding var showDetailView: Bool // 세부 정보 보기 여부를 바인딩하는 변수
    @Binding var detailPhoto: Photo? // 현재 선택된 사진을 저장하는 바인딩 변수
    @Binding var currentCardSize: CGSize // 카드 크기를 바인딩하는 변수
       
    // showDetailCOntent와 offset은 내부적으로 사용됩니다.
    @State var showDetailCOntent: Bool = false // 세부 정보 컨텐츠를 표시할지 여부를 추적하는 상태 변수
    @State var offset: CGFloat = 0 // 뷰의 수직 이동을 추적하는 상태 변수
    
    var animation: Namespace.ID // 뷰 간 애니메이션에 사용할 고유 식별자

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Image(photo.asssetName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: currentCardSize.width, height: currentCardSize.height)
                    .cornerRadius(15)
                    //.matchedGeometryEffect(id: photo, in: animation)
                VStack(spacing: 15) { // 텍스트 뷰를 포함하는 VStack
                    Text("") //제목
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    Text(sampleText)
                        .multilineTextAlignment(.leading)
                }.opacity(showDetailView ? 1 : 0) // 세부 정보 보기가 활성화되면 뷰의 불투명도를 1로 설정
                    .offset(y: showDetailCOntent ? 0 : 200) // 세부 정보가 표시되면 y축 방향으로 0으로 설정
            }
            .padding()
            .modifier(OffsetModifier(offset: $offset)) // OffsetModifier를 적용
        }
        .coordinateSpace(name: "SCROLL")
        .frame(maxWidth: .infinity, maxHeight: .infinity)  // 뷰의 최대 크기를 설정
        .background {
            Rectangle() // 배경에 레이어를 추가
                .fill(.ultraThinMaterial) // 레이어 색상을 설정
                .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(.easeInOut) {
                showDetailCOntent = true
            }
        }
        .onChange(of: offset) { newValue in
            if newValue > 120 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                    withAnimation(.easeInOut) { // 나타날 때 애니메이션을 추가
                        showDetailView = false // 세부 정보를 표시할 준비가 되면 변수 값을 변경
                    }
                }
            }
        }
        
    }
}



