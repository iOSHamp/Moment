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
    
    var body: some View {
        
        ZStack{
            
            Color.black
            
            ForEach((0...limitOfCard), id: \.self) { index in
                
                Card(isEaster: !dummies.contains(limitOfCard-index)  ,title:"mainCard\(limitOfCard-index)"
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
        
        if isEaster {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                moveDetail = true
                
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    isHidden = true
                    
                    
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
                                
            return AnyView(KayleDetailView())

            
        default:
                AnyView(EmptyView())
        }
        
        return AnyView(EmptyView())
        
    }
    
    
    var body: some View {
        
        ZStack{
            
            FrontCard(title: title, degree: $frontDegree)
            BackCard(degree: $backDegree)
            
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
        .onAppear{
            
            
            
            
        }
        
        
        
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
