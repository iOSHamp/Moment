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

struct Card : View {
    
    var title:String
    let back:String = "backCard"
    
    @State var isFlip:Bool = false
    
    var body: some View {
        
        ZStack{
            Image(title)
            Image()
            
        }
        
        
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
