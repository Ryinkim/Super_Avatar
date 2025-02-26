import SwiftUI

struct Fail: View {
    @State private var isFailVisible: Bool = true
    @State private var isVisible = false

    @State private var isLock: Bool = false
    
    @State private var isNoClick = 0
   
    var body: some View {
        VStack {
            if isLock {
                Lock()
            }
            
            if isFailVisible {
                ZStack {
                    if isNoClick == 1 {
                        Image("buttonNoRemove")
                            .resizable()
                            .frame(width: 150, height: 70)
                            .position(x: 1000, y: 615)
                            .zIndex(3)
                    }
                    
                    // background
                    Image("backgroundFail")
                        .resizable()
                        .frame(width: 1500, height: 1000)
                        .position(x: 650, y: 500)
                        .zIndex(0)
                    
                    Image("fail")
                        .resizable()
                        .frame(width: 1000, height: 700)
                        .position(x: 660, y: 450)
                        .zIndex(1)
                        .opacity(isVisible ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2.0)) {
                                isVisible = true
                            }
                        }
                    
                    Button(action: {
                        withAnimation {
                        isLock = true
                        isFailVisible = false
                        
                        }
                    }) {
                        Color.clear
                            .frame(width: 130, height: 50)
                    }
                    .position(x: 830, y: 620)
                    .zIndex(2)
                    
                    Button(action: {
                        withAnimation {
                            isNoClick += 1
                        }
                    }) {
                        Color.clear
                            .frame(width: 130, height: 50)
                    }
                    .position(x: 1000, y: 620)
                    .zIndex(2)
                }
            }
        }
    }
}
