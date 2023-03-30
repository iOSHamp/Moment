import SwiftUI



struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
               
            
                
                DeckOfCards()
                
               
                    
            }
            .ignoresSafeArea()
        }
        
        
        
    }
}


struct DeckOfCards : View {
    
    let limitOfCard:Int = 8
    let offset:Double = 2
    let dummies:[Int] = [0,3,7]
    
    @State var showPotal:Bool = false
    
    var body: some View {
        
        ZStack{
            
            Color.green
            
            if showPotal {
                Potal()
            }
            
            ForEach((0...limitOfCard), id: \.self) { index in
                
                Card(showPotal: $showPotal, isEaster: !dummies.contains(limitOfCard-index)  ,title:"mainCard\(limitOfCard-index)"
                     ,index:(limitOfCard-index)
                    )
                    .rotationEffect(Angle(degrees: offset * Double(index) ))
            }
            
        }
        
    }
    
}

struct FrontCard: View {
    var title:String
    @Binding var degree : Double
    
    var body:some View {
        
        Image(title)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
    
}

struct BackCard: View {
    let back:String = "backCard"
    let random:Int = Int.random(in: 0...2)
    @Binding var degree : Double
    
    var body:some View {
        
        Image("\(back)\(random)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
    
    
}

struct Card : View {
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    @State var moveDetail = false
    @State var isHidden:Bool = false
    
    @Binding var showPotal:Bool
    
    var isEaster:Bool
    
    let durationAndDelay : CGFloat = 0.2
    var title:String
    var index:Int
    
    
    func flipCard () {
          isFlipped = !isFlipped
          if isFlipped {
              withAnimation(.linear(duration: durationAndDelay)) {
                  backDegree = 90
              }
              withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                  frontDegree = 0
              }
          }
        
      }
    
    func goDetail() {
        
        print("GOGO")
        
        if isEaster {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                moveDetail = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    isHidden = true
                    
                   
                    
                }
    
            }
            
            
            withAnimation() {
                if index == 8 {
                    
                    
                    withAnimation(Animation.easeInOut(duration: 2).delay(1)) {
                        
                        showPotal = true
                    }
                    
                    
                }
            }
        }
        
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                withAnimation {
                    isHidden = true
                    
                   
                    
                }
                
                
            }
        }
        
    }
    
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
            
            
            FrontCard(title: title, degree: $frontDegree)
            BackCard(degree: $backDegree)
            
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
            } else {
                Text("")
            }
            
            NavigationLink(destination: getDestination(index: index), isActive: $moveDetail) {
                EmptyView()

                
            }
        }
        .opacity(isHidden ? 0 : 1)
        .frame(width:UIScreen.height/3,height:UIScreen.height)

        .onTapGesture {
            flipCard()


            if isFlipped {
                goDetail()
                
            }
            
            
            
        }
       

        
    }
    
}

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
                            
            
            Rectangle()
                .frame(width: 300,height: 300)
                .background(.red)
                .onTapGesture {
                    goTogallery = true
                }
        }
        
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
