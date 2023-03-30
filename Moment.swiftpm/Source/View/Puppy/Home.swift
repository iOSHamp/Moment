//
//  SwiftUIView.swift
//  
//
//  Created by Herry on 2023/03/27.
//

import SwiftUI
import AVFoundation
import ARKit


struct Home: View {
    
    
    //음악 재생 멈춤
    @State var playToggle: Bool = true
    
    // AVAudioPlayer 인스턴스 생성
    @State var audio : AVAudioPlayer!
    
    // MARK: Animated View Properties
    
    // 현재 인덱스와 선택된 탭 상태를 저장하는 State 변수
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Photos"
    
    @Namespace var animation // 뷰 간 공유할 애니메이션 네임스페이스
    @Environment(\.colorScheme) var scheme // 다크 모드 상태를 가져올 수 있는 환경 변
    
    //세부뷰
    
    @State var detailPhoto: Photo? // 현재 선택된 사진 정보
    @State var showDetailView: Bool = false // 세부 뷰의 표시 여부
    
    @State var currentCardSize: CGSize = .zero // 현재 카드의 크기
    
    var body: some View {
        ZStack {
            
            BGVIew() // 배경 뷰
            snowView(imageName: "lip", xPosition: 100)
            snowView(imageName: "lip2", xPosition: 200)
            // MARK: Main View Content
            VStack {
                
                // 메모리에 뭘 넣을지 생각해보면 좋을 듯
                // 커스텀 네비게이션 바
                
                HStack{
                    NavBar()
                 
                    Button {
                        if playToggle == true {
                            self.audio.stop()
                            playToggle.toggle()
                        } else {
                            self.audio.play()
                            playToggle.toggle()
                        }
                    } label: {
                        playToggle ? Image(systemName: "pause.circle").foregroundColor(.white) : Image(systemName: "play.circle").foregroundColor(.white)
                    }
                }
                // SnapCarousel 뷰를 이용해 사진 카드 뷰를 표시
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: photos)
                { photo in GeometryReader { proxy in
                        let size = proxy.size
                    
                        // 현재 카드에 해당하는 이미지 표시
                        Image(photo.asssetName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                            .onTapGesture {
                                // 카드를 선택하면 세부 뷰를 열어준다
                                currentCardSize = size
                                detailPhoto = photo
                                withAnimation(.easeInOut) {
                                    showDetailView = true
                                }
                            }
                    }
                }
                    .padding(.top, 30)
                    
                
                    // 커스텀 페이지 인디케이터
                    CustomIndicator()
                    

                    // ScrollView를 이용해 각 사진의 미리보기 이미지를 표시
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(photos) { photo in
                                Image(photo.asssetName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 120)
                                    .cornerRadius(15)
                                
                            }
                            
                        }
                    }
                }
            
            }
        .onAppear() {
            let song = NSDataAsset (name: "reminiscenceCut")
            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
            self.audio.play()
        }
            // ScrollView를 이용해 각 사진의 미리보기 이미지를 표시
            .overlay {
                if let photo = detailPhoto, showDetailView{
                    DetailView(photo: photo, showDetailView: $showDetailView, detailPhoto: $detailPhoto, currentCardSize: $currentCardSize, animation: animation)
                }
           }
        }
    
    // ScrollView를 이용해 각 사진의 미리보기 이미지를 표시
    @ViewBuilder
    func CustomIndicator() -> some View {
        HStack(spacing: 5) {
            ForEach(photos.indices, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
    // MARK: Custom NaviBar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing: 0) {
            ForEach(["Photo"], id: \.self) { tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background {
                            if currentTab == tab {
                                Capsule()
                                    .fill(.ultraThinMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                }
            }
        }
    }
    
    // MARK: Blurred BG
    @ViewBuilder
    func BGVIew() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(photos.indices, id: \.self) { index in
                    Image(photos[index].asssetName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            
            let color: Color = (scheme == .dark ? .black : .white)
            
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                
            ], startPoint: .top, endPoint: .bottom)
            
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
