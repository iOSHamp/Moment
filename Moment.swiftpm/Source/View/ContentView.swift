import SwiftUI

struct ContentView: View {
    
    @State var flip:Bool = false
    @State var opacity:CGFloat = .zero
    @State var backopacity:CGFloat = 1
    
    
    var body: some View {
        ZStack {
           
            DeckOfCards()
           
                
        }
        .ignoresSafeArea()
        
        
    }
}


struct DeckOfCards : View {
    
    let limitOfCard:Int = 8
    let offset:Double = 2
    
    var body: some View {
        
        ZStack{
            
            ForEach(0..<limitOfCard, id: \.self) { index in
                
                Card(title:"mainCard\(index+1)")
                    .rotationEffect(Angle(degrees: offset * Double(index) ))
            }
            
            
            
            
        }
        .preferredColorScheme(.dark)
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
    
    
    let durationAndDelay : CGFloat = 0.2
    var title:String
    
    
    func flipCard () {
          isFlipped = !isFlipped
          if isFlipped {
              withAnimation(.linear(duration: durationAndDelay)) {
                  backDegree = 90
              }
              withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                  frontDegree = 0
              }
          } else {
              withAnimation(.linear(duration: durationAndDelay)) {
                  frontDegree = -90
              }
              withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                  backDegree = 0
              }
          }
      }
    
    
    var body: some View {
        
        ZStack{

            FrontCard(title: title, degree: $frontDegree)
            BackCard(degree: $backDegree)
           

        }
        .frame(width:UIScreen.height/3,height:UIScreen.height)
        .onTapGesture {
            flipCard()
        }
        
        
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
