//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/03/27.
//

import SwiftUI


struct SnapCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content // SnapCarousel에서 보여줄 View를 담당하는 클로저
    var list: [T] // SnapCarousel에 표시될 데이터를 담은 배열
    
    //속성
    var spacing: CGFloat // SnapCarousel 내의 각 View 사이의 간격
    var trailingSpace: CGFloat // SnapCarousel 내에서 마지막 View와 오른쪽 가장자리 사이의 간격
    @Binding var index: Int // SnapCarousel 내에서 현재 선택된 View의 인덱스를 나타내는 바인딩 변수
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        // SnapCarousel의 초기화 함수. spacing, trailingSpace, index, items, content를 받아서 초기화
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        
    }
    
    @GestureState var offset: CGFloat = 0  // SnapCarousel에서 DragGesture로 이동할 때의 제스처 상태를 저장하는 변수
    @State var currentIndex: Int = 0 // SnapCarousel에서 현재 선택된 View의 인덱스를 저장하는 변수
    
    var body: some View {
        
        // SnapCarousel 내부의 View의 크기를 읽어오는 GeometryReader
        GeometryReader{ proxy in
            
            let width = (proxy.size.width - trailingSpace + spacing)  // SnapCarousel 내의 View 하나의 width
            let adjustMentWidth = (trailingSpace / 2)  - spacing // SnapCarousel의 가장자리에서 마지막 View까지의 거리
            
            
            // SnapCarousel 내의 각 View를 나열하는 HStack
            HStack(spacing: spacing) {
                
                // SnapCarousel에서 보여줄 View를 클로저에서 받아서 나타냄
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace ) // SnapCarousel 내의 View 크기를 맞춤
                    
                }
            }
            .padding(.horizontal, spacing)  // SnapCarousel 내의 View 사이의 간격을 맞춤
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? (adjustMentWidth) : -10) +  offset)
            .gesture(
                // SnapCarousel 내에서 DragGesture를 구현하는 gesture 블록
                DragGesture()// DragGesture 사용
                // DragGesture 상태를 업데이트하는 closure
                    .updating($offset, body: { value, out, _ in
                        // DragGesture의 translation 값을 offset에 대입
                        out = value.translation.width
                        
                    })
                
                // DragGesture의 최종 결과를 처리하는 closure
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0 )
    }
}

