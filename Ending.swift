import SwiftUI

struct Ending: View {
    @State private var isEndingVisible = true
    @State private var variables = Array(repeating: false, count: 15)
    var screenshot: UIImage?
    
    // button
    @State private var isButtonLeft = 0
    @State private var isButtonRight = 0
    @State private var xPosition: CGFloat = 1240
    
    // animation
    @State private var variable1 = false
    @State private var variable2 = false
    @State private var timerStarted = false

    var body: some View {
        VStack {
            if isEndingVisible {
                ZStack {
                    // Background
                    Image("backgroundEnding")
                        .resizable()
                        .frame(width: 1330, height: 1000)
                        .position(x: 665, y: -150)
                        .zIndex(0)
                    // button
                    Image("buttonEnding")
                        .resizable()
                        .frame(width: 1330, height: 250)
                        .position(x: 665, y: 195)
                        .zIndex(1)
                    Image("buttonEndingRight")
                        .resizable()
                        .frame(width: 173, height: 247)
                        .position(x: 1244, y: 193)
                        .zIndex(3)
                    Image("buttonEndingLeft")
                        .resizable()
                        .frame(width: 173, height: 247)
                        .position(x: 86, y: 193)
                        .zIndex(3)
                    
                    if variable1 {
                        Image("lightening1")
                            .resizable()
                            .frame(width: 1350, height: 1000)
                            .position(x: 670, y: -300)
                            .zIndex(3)
                    }
                    if variable2 {
                        Image("lightening2")
                            .resizable()
                            .frame(width: 1350, height: 1000)
                            .position(x: 670, y: -300)
                            .zIndex(3)
                    }

                    Image("characterSet")
                        .resizable()
                        .frame(width: 2320, height: 250)
                        .position(x: xPosition, y: 195)
                        .zIndex(2)
                    
                    Button(action: {
                        withAnimation {
                            if isButtonLeft > 0 {
                                isButtonRight += 1
                                isButtonLeft -= 1
                                xPosition += 230
                            }
                        }
                    }) {
                        Color.clear
                            .frame(width: 200, height: 240)
                    }
                    .position(x: 80, y: 195)
                    .zIndex(5)
                    
                    Button(action: {
                        withAnimation {
                            if isButtonRight > -5 {
                                isButtonLeft += 1
                                isButtonRight -= 1
                                xPosition -= 230
                            }
                        }
                    }) {
                        Color.clear
                            .frame(width: 200, height: 240)
                    }
                    .position(x: 1260, y: 195)
                    .zIndex(4)
                    
                    }
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
                    variable2 = false
                case 2:
                    variable2 = true
                    variable1 = false
                default:
                    break
                }
            }
            timerCount += 1
            
            if timerCount > 2 {
                timerCount = 1
            }
        }
    }
}
