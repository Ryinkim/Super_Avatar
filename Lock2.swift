import SwiftUI

struct Lock2: View {
    @StateObject var character = Character()
    
    @State private var isLock2Visible: Bool = true
    @State private var buttonCLicked = 19
    @State private var isFail2Visible = false
    @State private var isGameView2 = false
    
    @State private var isVisible = false
    @State private var isNotVisible = true
    @State private var isNotVisible2 = true
    
    @State private var isPageMain = false
    @State private var isWrongBrowser = false
    @State private var isPassword = false
    @State private var isAccount = false
    @State private var isSecurity = false
    
    @State private var isOnOff = false
    @State private var isWrongOrder = false
    @State private var changeThePassword = false
    @State private var changeThePasswordWrong1 = false
    @State private var changeThePasswordWrong3 = false
    @State private var changeThePasswordWrong4 = false
    @State private var isLogout = false
    @State private var isScan1 = false
    @State private var isScan2 = false
    @State private var isLoading = false
    
    @State private var currentImageIndex = 0
    @State private var variables = Array(repeating: false, count: 60)
    @State private var isTimer = true
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            if isGameView2 {
                GameView2()
            }
                if isLock2Visible {
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
                        
                        // 1 min timer
                        if isTimer {
                            let timerImages = (stride(from: 60, to: -1, by: -1)).map { "timer\($0)" }
                            Image(timerImages[currentImageIndex])
                                .resizable()
                                .frame(width: 120, height: 80)
                                .position(x: 60, y: 60)
                                .zIndex(5)
                                .onAppear {
                                    startUpdatingVariables()
                                }
                        }
                        
                        // page
                        if isPageMain {
                            Image("pageMain")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(3)
                            Button(action: {
                                isPageMain = false
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(4)
                        }
                        if !isPageMain {
                            Button(action: {
                                isPageMain = true
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(4)
                        }
                        
                        // Password
                        if isOnOff {
                            Image("pagePasswordOff")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            Button(action: {
                                isOnOff = false
                                isPassword = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 1150, y: 350)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                isOnOff = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        if changeThePasswordWrong1 {
                            Image("pageChangeThePasswordCapital")
                                .resizable()
                                .frame(width: 100, height: 80)
                                .position(x: 950, y: 600)
                                .zIndex(6)
                        }
                        if changeThePasswordWrong3 {
                            Image("pageChangeThePasswordNumber")
                                .resizable()
                                .frame(width: 70, height: 40)
                                .position(x: 950, y: 730)
                                .zIndex(6)
                        }
                        if changeThePasswordWrong4 {
                            Image("pageChangeThePasswordLetter")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .position(x: 1120, y: 730)
                                .zIndex(6)
                        }
                        if changeThePassword && buttonCLicked == 19 {
                            Image("pageChangeThePassword")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            // wrong ans 1
                            Button(action: {
                                changeThePasswordWrong1 = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 950, y: 520)
                            .zIndex(5)
                            // correct ans 2
                            Button(action: {
                                buttonCLicked += 1
                                isPageMain = false
                                isPassword = false
                                isAccount = false
                                isSecurity = false
                                isWrongBrowser = false
                                changeThePasswordWrong1 = false
                                changeThePasswordWrong3 = false
                                changeThePasswordWrong4 = false
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1120, y: 520)
                            .zIndex(5)
                            // wrong ans 3
                            Button(action: {
                                changeThePasswordWrong3 = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 950, y: 670)
                            .zIndex(5)
                            // wrong ans 4
                            Button(action: {
                                changeThePasswordWrong4 = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 1120, y: 670)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                changeThePassword = false
                                isPassword = true
                                changeThePasswordWrong1 = false
                                changeThePasswordWrong3 = false
                                changeThePasswordWrong4 = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        if isPassword && buttonCLicked == 19 {
                            Image("pagePassword")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            Button(action: {
                                isPassword = false
                                isOnOff = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 1150, y: 350)
                            .zIndex(5)
                            // change the password
                            Button(action: {
                                isPassword = false
                                changeThePassword = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 600)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                isPassword = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        if isPassword && buttonCLicked >= 20 {
                            Image("pagePasswordCheck")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            Button(action: {
                                isPassword = false
                                isOnOff = true
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                            .position(x: 1150, y: 350)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                isPassword = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        // Account
                        if isWrongOrder {
                            Image("text8")
                                .resizable()
                                .frame(width: 800, height: 250)
                                .position(x: 660, y: 770)
                                .zIndex(6)
                                .opacity(isNotVisible2 ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 1.0)) {
                                        isWrongOrder = false
                                    }
                                }
                        }
                        if isLogout {
                            Image("pageLogout")
                                .resizable()
                                .frame(width: 800, height: 500)
                                .position(x: 660, y: 470)
                                .zIndex(5)
                            Button(action: {
                                buttonCLicked += 1
                                isLogout = false
                                isAccount = false
                            }) {
                                Color.clear
                                    .frame(width: 150, height: 70)
                            }
                            .position(x: 950, y: 580)
                            .zIndex(6)
                            Button(action: {
                                isLogout = false
                            }) {
                                Color.clear
                                    .frame(width: 150, height: 70)
                            }
                            .position(x: 780, y: 580)
                            .zIndex(6)
                        }
                        if isAccount && buttonCLicked == 19 {
                            Image("pageAccount")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            // Logout
                            Button(action: {
                                isWrongOrder = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1030, y: 670)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                isAccount = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        if isAccount && buttonCLicked == 20 {
                            Image("pageAccount")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            // Logout
                            Button(action: {
                                isLogout = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1030, y: 670)
                            .zIndex(5)
                            // exit
                            Button(action: {
                                isAccount = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        if isAccount && buttonCLicked >= 21 {
                            Image("pageAccountCheck")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(4)
                            // exit
                            Button(action: {
                                isAccount = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(5)
                        }
                        // Language & Alarm
                        if isWrongBrowser {
                            Image("text7")
                                .resizable()
                                .frame(width: 800, height: 250)
                                .position(x: 660, y: 770)
                                .zIndex(7)
                                .opacity(isNotVisible ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 1.0)) {
                                        isWrongBrowser = false
                                    }
                                }
                        }
                        // Security
                        if isLoading {
                            Image("loading2")
                                .resizable()
                                .frame(width: 900, height: 152)
                                .position(x: 650, y: 500)
                                .zIndex(10)
                            
                            Image("loading3")
                                .resizable()
                                .frame(width: 900, height: 152)
                                .position(x: 650, y: 500)
                                .zIndex(11)
                                .opacity(isVisible ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 2.5)) {
                                        isVisible = true
                                    }
                                }
                        }
                        if isScan1 {
                            Image("pageScan1")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(6)
                            // delete
                            Button(action: {
                                isScan1 = false
                                isScan2 = true
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 50)
                            }
                            .position(x: 1150, y: 410)
                            .zIndex(7)
                            // exit
                            Button(action: {
                                isScan1 = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(7)
                        }
                        if isScan2 {
                            Image("pageScan2")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(6)
                            // exit
                            Button(action: {
                                isScan2 = false
                                buttonCLicked += 1
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(7)
                        }
                        if isSecurity && buttonCLicked >= 19 && buttonCLicked <= 20 {
                            Image("pageSecurity")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(5)
                            // install
                            Button(action: {
                                isWrongOrder = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 80)
                            }
                            .position(x: 1050, y: 700)
                            .zIndex(6)
                            // check security
                            Button(action: {
                                isWrongOrder = true
                            }) {
                                Color.clear
                                    .frame(width: 150, height: 60)
                            }
                            .position(x: 1050, y: 630)
                            .zIndex(6)
                            // exit
                            Button(action: {
                                isSecurity = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(6)
                        }
                        if isSecurity && buttonCLicked == 21 {
                            Image("pageSecurity")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(5)
                            // install
                            Button(action: {
                                isWrongOrder = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 80)
                            }
                            .position(x: 1050, y: 700)
                            .zIndex(6)
                            // check security
                            Button(action: {
                                isScan1 = true
                            }) {
                                Color.clear
                                    .frame(width: 150, height: 60)
                            }
                            .position(x: 1050, y: 630)
                            .zIndex(6)
                            // exit
                            Button(action: {
                                isSecurity = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(6)
                        }
                        if isSecurity && buttonCLicked == 22 {
                            Image("pageSecurityCheck1")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(5)
                            // install
                            Button(action: {
                                isLoading = true
                                isSecurity = false
                                buttonCLicked += 1
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 80)
                            }
                            .position(x: 1050, y: 700)
                            .zIndex(6)
                            // exit
                            Button(action: {
                                isSecurity = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(6)
                        }
                        if isSecurity && buttonCLicked == 23 {
                            Image("pageSecurityCheck2")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(5)
                            // exit
                            Button(action: {
                                isSecurity = false
                                isLoading = false
                                buttonCLicked += 1
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(6)
                        }
                        if isSecurity && buttonCLicked >= 24 {
                            Image("pageSecurityCheck2")
                                .resizable()
                                .frame(width: 750, height: 550)
                                .position(x: 1050, y: 570)
                                .zIndex(5)
                            // exit
                            Button(action: {
                                isSecurity = false
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 1150, y: 790)
                            .zIndex(6)
                        }
                        
                        // story
                        if (buttonCLicked == 19) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 20) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 21) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 22) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 23) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 24) {
                            Image("browser")
                                .resizable()
                                .frame(width: 1350, height: 800)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isPageMain = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 120, height: 120)
                            }
                            .position(x: 1190, y: 250)
                            .zIndex(3)
                            
                            // password & account & security
                            Button(action: {
                                isPassword = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 350)
                            .zIndex(3)
                            Button(action: {
                                isAccount = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1050, y: 450)
                            .zIndex(5)
                            Button(action: {
                                isSecurity = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 90)
                            }
                            .position(x: 1050, y: 800)
                            .zIndex(3)
                            // language & alarm
                            Button(action: {
                                isWrongBrowser = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 600)
                            .zIndex(3)
                            Button(action: {
                                isWrongBrowser = true
                                isLoading = false
                            }) {
                                Color.clear
                                    .frame(width: 300, height: 100)
                            }
                            .position(x: 1000, y: 700)
                            .zIndex(3)
                            
                            // close button
                            Button(action: {
                                buttonCLicked += 1
                                isPageMain = false
                                isTimer = false
                                stopTimer()
                            }) {
                                Color.clear
                                    .frame(width: 50, height: 50)
                            }
                            .position(x: 120, y: 120)
                            .zIndex(3)
                            
                        } else if (buttonCLicked == 25) {
                            Image("pageRecover")
                                .resizable()
                                .frame(width: 1050, height: 700)
                                .position(x: 670, y: 470)
                                .zIndex(2)
                            Button(action: {
                                isGameView2 = true
                                isLock2Visible = false
                            }) {
                                Color.clear
                                    .frame(width: 230, height: 100)
                            }
                            .position(x: 670, y: 720)
                            .zIndex(3)
                        }
                    }
                }
                if (isFail2Visible) {
                    Fail2()
                }
            }
        }
    
    func startUpdatingVariables() {
        var timerCount = 60
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            DispatchQueue.main.async {
                currentImageIndex = 60 - timerCount
            }
            
            timerCount -= 1
            
            if timerCount < 1 {
                isFail2Visible = true
                isLock2Visible = false
                
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
