import SwiftUI


// 앱의 첫 화면
struct ContentView: View {
    
    
    var body: some View {
        //네비게이션 뷰 -> Back 버튼
        NavigationView {
            ZStack {
                
                // 바로 아래 DeckOfCards 뷰
                DeckOfCards()
                    
            }
            .ignoresSafeArea()
        }
        
        
        
    }
}

// 카드 덱 전체를 나타내는 뷰
struct DeckOfCards : View {
    
    let limitOfCard:Int = 8 // 카드 덱의 카드 수
    let offset:Double = 2 // 카드 덱의 회전 각도
    let dummies:[Int] = [0,3,7] // 이스터 에그를 제외한 카드의 인덱스
    
    @State var showPotal:Bool = false  // portal 뷰를 나타내는 변수
    
    var body: some View {
        
        ZStack{
            
            // 배경 색
            Color.black
            
            if showPotal {
                Potal() // portal 뷰
            }
            
            // 카드 생성
            ForEach((0...limitOfCard), id: \.self) { index in
                
                Card(showPotal: $showPotal, isEaster: !dummies.contains(limitOfCard-index)  ,title:"mainCard\(limitOfCard-index)"
                     ,index:(limitOfCard-index)
                    )
                    .rotationEffect(Angle(degrees: offset * Double(index) ))
            }
            
        }
        
    }
    
}

// 앞면 카드 뷰
struct FrontCard: View {
    var title:String // 카드 이미지 파일명
    @Binding var degree : Double // 카드의 회전 각도
    
    var body:some View {
        
        Image(title)
            .resizable()
            .aspectRatio(contentMode: .fit)
            // 카드의 회전각도를 바인딩하는 변수
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
    
}

// 뒷면 카드 뷰
struct BackCard: View {
    let back:String = "backCard" // 카드 뒷면 이미지 파일명
    let random:Int = Int.random(in: 0...2) // 카드 뒷면 이미지 랜덤으로 선택
    @Binding var degree : Double // 카드의 회전각도를 바인딩하는 변수
    
    var body:some View {
        
        Image("\(back)\(random)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
    
    
}

// 카드 뷰
struct Card : View {
     
    // 카드에 대한 속성값들 선언
    @State var backDegree = 0.0 // 뒷면 카드의 회전각도
    @State var frontDegree = -90.0 // 앞면 카드의 회전각도
    @State var isFlipped = false // 카드가 뒤집어졌는지 여부
    @State var moveDetail = false // 카드를 탭했을 때 디테일 뷰로 이동해야 하는지 여부
    @State var isHidden:Bool = false // 카드가 숨겨져야 하는지 여부
    
    @Binding var showPotal:Bool // portal 뷰를 나타내는 변수

    
    var isEaster:Bool // 카드에 이스터 에그가 있는지 여부
    
    let durationAndDelay : CGFloat = 0.2 // 카드가 회전하는데 걸리는 시간
    var title:String // 카드의 이미지 파일명
    var index:Int
    
    // 카드를 뒤집는 함수
    func flipCard () {
          isFlipped = !isFlipped
        // 회전 애니메이션 추가
          if isFlipped {
              withAnimation(.linear(duration: durationAndDelay)) {
                  backDegree = 90
              }
              withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                  frontDegree = 0
              }
          }
        
      }
    
    // 디테일 뷰로 이동하는 함수
    func goDetail() {
        
        print("GOGO")
        
        // 이스터 에그가 있는 경우, 일정 시간이 지난 후에 디테일 뷰로 이동하도록 함
        if isEaster {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                moveDetail = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    isHidden = true
                    
                   
                    
                }
    
            }
            
            // 인덱스가 8인 경우, portal 뷰를 띄우는 애니메이션 추가
            withAnimation() {
                if index == 8 {
                    
                    
                    withAnimation(Animation.easeInOut(duration: 2).delay(1)) {
                        
                        showPotal = true
                    }
                    
                    
                }
            }
        }
        // 이스터 에그가 없는 경우, 일정 시간이 지난 후에 카드를 숨기도록 함
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                withAnimation {
                    isHidden = true
                    
                   
                    
                }
                
                
            }
        }
        
    }
    
    
    // 각 인덱스에 맞는 디테일 뷰를 반환하는 함수
    func getDestination (index:Int) -> AnyView {
        
        
        switch index {
            
        case 1:
            return AnyView(ClaudiaDetailView())
            
        case 2:
            return AnyView(nikoDetailView())
                
        case 4:
            return AnyView(PuppyDetailView())
            
        case 5:
            return AnyView(OliverDetailView())
                     
        case 6:
            return AnyView(KiyoungDetailView())
       
            
        case 8:
                                
            return AnyView(KayleDetailView(resultHour: 0, resultMin: 0, resultSec: 0))

            
        default:
                return AnyView(EmptyView())
        }
        
        return AnyView(EmptyView())
        
    }
    
    
    

    var body: some View {
        
        ZStack{
            
            // front card 뷰
            FrontCard(title: title, degree: $frontDegree)
            
            // back card 뷰
            BackCard(degree: $backDegree)
            
            
            // 이스터에그 존재시 파티클 애니메이션 뷰 표시
            if isFlipped && isEaster {
                ZStack{
                    Circle()
                    .fill(Color.blue)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: -100, y : -50)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 60, y : 70)
                }
                // 이스터에그가 없으면 빈 텍스트 뷰 표시
            } else {
                Text("")
            }
            // 뷰를 클릭하면 세부 정보 페이지로 이동하는 링크
            NavigationLink(destination: getDestination(index: index), isActive: $moveDetail) {
                EmptyView()

                
            }
        }
        // isHidden 값에 따라 뷰 표시 여부 결정
        .opacity(isHidden ? 0 : 1)
        // 뷰 크기 설정
        .frame(width:UIScreen.height/3,height:UIScreen.height)

        // 뷰를 탭했을 때 실행될 동작
        .onTapGesture {
            flipCard()

            // 뷰가 뒤집어졌을 때, 세부 정보 페이지로 이동
            if isFlipped {
                goDetail()
                
            }
            
            
            
        }
       

        
    }
    
}

// 아래 두개 struct는 폭죽효과에 관련된 것
struct FireworkParticlesGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}

struct ParticlesModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<100, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}



struct Potal:View {
    
    @State var goTogallery:Bool = false
    
    var body: some View {
        
        ZStack{
            
            NavigationLink(destination: Home(), isActive: $goTogallery) {
                EmptyView()
            }
            
            Button {
                goTogallery = true
            } label: {
                Image("potal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                         
            }

       
            
//            Rectangle()
//                .frame(width: 300,height: 300)
//                .background(.red)
//                .onTapGesture {
//                    goTogallery = true
//                }
        }
        
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
