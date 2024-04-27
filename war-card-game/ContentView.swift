import SwiftUI

struct ContentView: View {
    @State var playerCard = "card6";
    @State var cpuCard = "card9";
    @State var playerScore: Int = 0;
    @State var cpuScore: Int = 0;
    
    func toCardString(num: Int) -> String {
        return "card"+String(num)
    }
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                if playerScore > cpuScore {
                    Image(systemName: "hand.thumbsup.fill")
                } else if playerScore < cpuScore {
                    Image(systemName: "hand.thumbsdown.fill")
                } else {
                    Image(systemName: "scribble")
                }
                
                Button(action: {
                    let newPlayerCardInt = Int.random(in: 2..<15)
                    let newCPUCardInt = Int.random(in: 2..<15)
                    playerCard = toCardString(num: newPlayerCardInt)
                    cpuCard = toCardString(num: newCPUCardInt)
                    if newPlayerCardInt > newCPUCardInt {
                        let impactMed = UIImpactFeedbackGenerator(style: .rigid)
                        impactMed.impactOccurred()
                        
                        playerScore += 1
                    } else if cpuScore > playerScore {
                        cpuScore += 1
                    }
                }, label: {
                    Image("dealbutton")
                })
                
                // Cheating
//                Button(action: {playerScore += 100}){
//                    Text("Cheat Player")
//                }
//                Button(action: {cpuScore += 100}){
//                    Text("Cheat Bot")
//                }
                
//                Button("Click Me!"){
//                    print("You clicked me!")
//                }
//                
//                Button(action: {print("Click Me!")}){
//                    Image(systemName: "app.fill")
//                    Text("HI")
//                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
