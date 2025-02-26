import SwiftUI

struct Lock: View {
    @State private var isLockVisible: Bool = true
    @State private var isFailVisible = false
    @State private var buttonCLicked = 0
    @State private var isLock2 = false
    
    @State private var isVisible = false
    @State private var isVisible2 = false
    @State private var isVisible3 = false
    @State private var isVisible4 = false
    @State private var isNotVisible = true
    @State private var isNotVisible2 = true
    @State private var isNotVisible3 = true
    @State private var isNotVisible4 = true
    @State private var isNotVisible5 = true
    @State private var isNotVisible6 = true
    @State private var isNotVisible7 = true

    @State private var isFail1 = false
    @State private var isFail2 = false
    @State private var isFail3 = false
    @State private var isFail4 = false
    @State private var isFail5 = false
    
    @State private var currentImageIndex = 0
    @State private var variables = Array(repeating: false, count: 30)
    @State private var isTimer = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            
            if (isLock2) {
                Lock2()
            }
            
            if isLockVisible {
                ZStack {
                    // Background images
                    Image("LockBackground")
                        .resizable()
                        .frame(width: 1500, height: 1000)
                        .position(x: 650, y: 500)
                        .zIndex(0)
                    Image("warning")
                        .resizable()
                        .frame(width: 1100, height: 700)
                        .position(x: 660, y: 450)
                        .zIndex(0)

                    // 30 sec timer
                    if isTimer {
                        let timerImages = (stride(from: 30, to: -1, by: -1)).map { "timer\($0)" }
                        Image(timerImages[currentImageIndex])
                            .resizable()
                            .frame(width: 120, height: 80)
                            .position(x: 60, y: 60)
                            .zIndex(5)
                            .onAppear {
                                startUpdatingVariables()
                            }
                    }
              
                    if !(buttonCLicked == 5 || buttonCLicked == 6 || (buttonCLicked >= 9 && buttonCLicked <= 14) || buttonCLicked == 18) {
                        Image("nextButton")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .position(x: 1200, y: 850)
                            .zIndex(1)
                        Button(action: {
                                buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 50, height: 50)
                        }
                        .position(x: 1200, y: 850)
                        .zIndex(2)
                    }
                    
                    // quizFail
                    if isFail1 {
                        Image("wrong1")
                            .resizable()
                            .frame(width: 1500, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(2)
                            .opacity(isNotVisible2 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isFail1 = false
                                }
                            }
                    }
                    if isFail2 {
                        Image("wrong2")
                            .resizable()
                            .frame(width: 1500, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(2)
                            .opacity(isNotVisible3 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isFail2 = false
                                }
                            }
                    }
                    if isFail3 {
                        Image("wrong2")
                            .resizable()
                            .frame(width: 1500, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(2)
                            .opacity(isNotVisible4 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isFail3 = false
                                }
                            }
                    }
                    if isFail4 {
                        Image("wrong3")
                            .resizable()
                            .frame(width: 1500, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(2)
                            .opacity(isNotVisible5 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isFail4 = false
                                }
                            }
                    }
                    if isFail5 {
                        Image("wrong2")
                            .resizable()
                            .frame(width: 1500, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(2)
                            .opacity(isNotVisible6 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isFail5 = false
                                }
                            }
                    }
                  
                   // story
                    if (buttonCLicked == 1) {
                        Image("text1")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(0)
                    } else if (buttonCLicked == 2) {
                        Image("text2")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(0)
                    } else if (buttonCLicked == 3) {
                        Image("solveProblems")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 460, y: 300)
                            .zIndex(0)
                            .opacity(isVisible ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isVisible = true
                                }
                            }
                    } else if (buttonCLicked == 4) {
                        Image("solveProblems")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 460, y: 300)
                            .zIndex(0)
                        Image("text3")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(1)
                    } else if (buttonCLicked == 5) {
                        Image("solveProblems")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 460, y: 300)
                            .zIndex(0)
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 50, height: 50)
                        }
                        .position(x: 230, y: 70)
                        .zIndex(1)
                        Image("text4")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(1)
                     
                    } else if (buttonCLicked == 6) {
                        Image("solveProblems")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 460, y: 300)
                            .zIndex(0)
                        Image("error")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 660, y: 470)
                            .zIndex(0)
                            .opacity(isVisible2 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isVisible2 = true
                                }
                            }
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 150, height: 50)
                        }
                        .position(x: 880, y: 550)
                        .zIndex(1)
                   
                    } else if (buttonCLicked == 7) {
                        Image("solveProblems")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 460, y: 300)
                            .zIndex(0)
                        Image("text5")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(0)
                    } else if (buttonCLicked == 8) {
                        Image("oneMinute")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 900, y: 500)
                            .zIndex(0)
                            .opacity(isVisible3 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isVisible3 = true
                                }
                            }
                    } else if (buttonCLicked == 9) {
                        Image("oneMinute")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 900, y: 500)
                            .zIndex(0)
                        Image("text6")
                            .resizable()
                            .frame(width: 800, height: 250)
                            .position(x: 660, y: 770)
                            .zIndex(0)
                        
                        Image("nextButton")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .position(x: 1200, y: 850)
                            .zIndex(1)
                        Button(action: {
                                buttonCLicked += 1
                                isTimer = true
                        }) {
                            Color.clear
                                .frame(width: 50, height: 50)
                        }
                        .position(x: 1200, y: 850)
                        .zIndex(2)
                    } else if (buttonCLicked == 10) { // First question
                        Image("questionFirst")
                            .resizable()
                            .frame(width: 1000, height: 600)
                            .position(x: 660, y: 450)
                            .zIndex(0)
                        Image("letsStart")
                            .resizable()
                            .frame(width: 1700, height: 1100)
                            .position(x: 650, y: 500)
                            .zIndex(0)
                            .opacity(isNotVisible ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    isNotVisible = false
                                }
                            }
                        
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 520)
                        .zIndex(1)
                        Button(action: {
                            isFail1 = true
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 630)
                        .zIndex(1)
                     
                    } else if (buttonCLicked == 11) {
                        Image("questionSecond")
                            .resizable()
                            .frame(width: 1000, height: 600)
                            .position(x: 660, y: 450)
                            .zIndex(0)
                        
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 520)
                        .zIndex(1)
                        Button(action: {
                            isFail2 = true
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 630)
                        .zIndex(1)
                     
                    } else if (buttonCLicked == 12) {
                        Image("questionThird")
                            .resizable()
                            .frame(width: 1000, height: 600)
                            .position(x: 660, y: 450)
                            .zIndex(0)
                        
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 520)
                        .zIndex(1)
                        Button(action: {
                            isFail3 = true
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 630)
                        .zIndex(1)
                  
                    } else if (buttonCLicked == 13) {
                        Image("questionFourth")
                            .resizable()
                            .frame(width: 1000, height: 600)
                            .position(x: 660, y: 450)
                            .zIndex(0)
                        
                        Button(action: {
                            isFail4 = true
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 520)
                        .zIndex(1)
                        Button(action: {
                            buttonCLicked += 1
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 630)
                        .zIndex(1)
                 
                    } else if (buttonCLicked == 14) {
                        Image("questionFifth")
                            .resizable()
                            .frame(width: 1000, height: 600)
                            .position(x: 660, y: 450)
                            .zIndex(0)
                        
                        Button(action: {
                            isFail5 = true
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 520)
                        .zIndex(1)
                        Button(action: {
                            buttonCLicked += 1
                            stopTimer()
                            isTimer = false
                        }) {
                            Color.clear
                                .frame(width: 500, height: 50)
                        }
                        .position(x: 660, y: 630)
                        .zIndex(1)
            
                    } else if (buttonCLicked == 15) {
                        
                    } else if (buttonCLicked == 16) {
                        Image("hacker1")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 560, y: 400)
                            .zIndex(0)
                    } else if (buttonCLicked == 17) {
                        Image("hacker2")
                            .resizable()
                            .frame(width: 800, height: 500)
                            .position(x: 750, y: 450)
                            .zIndex(0)
                    } else if (buttonCLicked == 18) {
                        Image("hacker3")
                            .resizable()
                            .frame(width: 1100, height: 690)
                            .position(x: 650, y: 400)
                            .zIndex(0)
                            .opacity(isNotVisible7 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 3.5)) {
                                    isNotVisible7 = false
                                }
                            }
                 
                        Image("pageGuide")
                            .resizable()
                            .frame(width: 1350, height: 900)
                            .position(x: 680, y: 500)
                            .zIndex(3)
                            .opacity(isVisible4 ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 2.0)) {
                                    isVisible4 = true
                                }
                            }
                        Button(action: {
                            isVisible4 = false
                            isLock2 = true
                            isLockVisible = false
                        }) {
                            Color.clear
                                .frame(width: 200, height: 100)
                        }
                        .position(x: 1250, y: 900)
                        .zIndex(4)
                    }
                }
            }
            if (isFailVisible) {
                Fail()
            }
        }
    }
    
    func startUpdatingVariables() {
        var timerCount = 30

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            DispatchQueue.main.async {
                currentImageIndex = 30 - timerCount
            }
               
            timerCount -= 1
               
            if timerCount < 1 {
                isFailVisible = true
                isLockVisible = false
                   
                timer.invalidate()
                isTimer = false
            }
        }
    }
    func stopTimer() {
        timer?.invalidate()
        isTimer = false
    }
}
