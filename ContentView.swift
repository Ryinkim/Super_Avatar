import SwiftUI

struct ContentView: View {
    @State private var isContentVisible = true
    
    @State private var variable1 = false
    @State private var variable2 = false
    @State private var variable3 = false
    @State private var variable4 = false
    @State private var variable5 = false
    @State private var variable6 = false

    var body: some View {
        VStack {
            if isContentVisible {
                ZStack {
                    if variable1 {
                        Image("character1")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    if variable2 {
                        Image("character2")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    if variable3 {
                        Image("character3")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    if variable4 {
                        Image("character4")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    if variable5 {
                        Image("character5")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    if variable6 {
                        Image("character6")
                            .resizable()
                            .frame(width: 730, height: 920)
                            .position(x: 650, y: 635)
                            .zIndex(3)
                    }
                    
                    Image("background")
                        .resizable()
                        .frame(width: 1350, height: 1050)
                        .position(x: 670, y: 450)
                        .zIndex(0)
                    
                    Image("gameName")
                        .resizable()
                        .frame(width: 920, height: 390)
                        .position(x: 650, y: 200)
                        .zIndex(1)
                    
                    Image("startButton")
                        .resizable()
                        .frame(width: 280, height: 180)
                        .position(x: 650, y: 870)
                        .zIndex(2)
    
                    Button(action: {
                        withAnimation {
                            isContentVisible = false
                        }
                    }) {
                        Color.clear
                            .frame(width: 280, height: 180)
                    }
                    .position(x: 650, y: 870)
                    .zIndex(4)
                }
            } else {
                GameView()
            }
        }
        .onAppear {
            startUpdatingVariables()
        }
    }

    func startUpdatingVariables() {
        var timerCount = 1
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { timer in
            DispatchQueue.main.async {
                switch timerCount {
                case 1:
                    variable1 = true
                    variable6 = false
                case 2:
                    variable2 = true
                    variable1 = false
                case 3:
                    variable3 = true
                    variable2 = false
                case 4:
                    variable4 = true
                    variable3 = false
                case 5:
                    variable5 = true
                    variable4 = false
                case 6:
                    variable6 = true
                    variable5 = false
                default:
                    break
                }
            }
            timerCount += 1
            
            if timerCount > 6 {
                timerCount = 1
            }
        }
    }
}
