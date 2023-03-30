import SwiftUI

struct KayleDetailView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var resultSecond = 22291200
    @State var resultHour: Int
    @State var resultMin: Int
    @State var resultSec: Int
    
    var body: some View {
        GeometryReader { geometry in
            
            
            VStack {
                Image("mainCard8")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 500)
        
                ZStack {
                        
                    Image("Count")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height / 3)
                    
                    
                    Text("\(resultHour, specifier: "%.02i"):\(resultMin, specifier: "%.02i"):\(resultSec, specifier: "%.02i")")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .padding(.bottom, 50)
                        .onReceive(timer) { _ in
                            if resultSecond > 0  {
                               resultSecond -= 1
                                
                                resultHour = resultSecond / 3600
                                resultMin = (resultSecond - (resultHour * 3600)) / 60
                                resultSec = resultSecond - (resultHour * 3600) - (resultMin * 60)
                                
                            }
                        }
                    
                }
            }
        }
    }
}



struct KayleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KayleDetailView(resultHour: 0, resultMin: 0, resultSec: 0)
    }
}
