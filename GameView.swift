import SwiftUI
import Subsonic

struct GameView: View {
    @State private var isGameViewVisible = true
    @State private var isFaceColorScreen = false
    @State private var isMusic = false
    @State private var isMusicButtonClick = false

    @State private var skinColor = "characterDefault"
    @State private var eye = "valueDefault"
    @State private var hair = "valueDefault"
    @State private var clothes = "valueDefault"
    @State private var pants = "valueDefault"
    @State private var socks = "valueDefault"
    @State private var makeup = "valueDefault"
    @State private var characterBackground = "defaultBackground"
    
    // characterButton
    @State private var isFaceColor = true
    @State private var isEye = true
    @State private var isMakeup = true
    @State private var isHair = true
    @State private var isClothes = true
    @State private var isPants = true
    @State private var isSocks = true
    @State private var isCharacterBackground = true
    
    // screenButton
    @State private var isButtonContent = false
    @State private var isButtonLock = false

    // value
    @State private var isFaceColorValue = false
    @State private var isEyeValue = false
    @State private var isHairValue = false
    @State private var isClothesValue = false
    @State private var isPantsValue = false
    @State private var isSocksValue = false
    @State private var isMakeupValue = false
    @State private var isBackgroundValue = false

    var body: some View {
        VStack {
            if isGameViewVisible {
                ZStack {
                    // Background images
                    Image("backgroundGameView")
                        .resizable()
                        .frame(width: 2000, height: 1500)
                        .position(x: 670, y: 600)
                        .zIndex(0)
                    Image("designTab")
                        .resizable()
                        .frame(width: 850, height: 500)
                        .position(x: 660, y: 880)
                        .zIndex(2)
                    Image("curtain")
                        .resizable()
                        .frame(width: 965, height: 1030)
                        .position(x: 660, y: 349)
                        .zIndex(2)
                    
                    // character
                    Image(skinColor)
                        .resizable()
                        .frame(width: 700, height: 1050)
                        .position(x: 650, y: 440)
                        .zIndex(6)
                    Image(eye)
                        .resizable()
                        .frame(width: 700, height: 900)
                        .position(x: 650, y: 415)
                        .zIndex(7)
                    Image(hair)
                        .resizable()
                        .frame(width: 685, height: 990)
                        .position(x: 650, y: 432)
                        .zIndex(8)
                    Image(clothes)
                        .resizable()
                        .frame(width: 740, height: 1100)
                        .position(x: 650, y: 445)
                        .zIndex(8)
                    Image(pants)
                        .resizable()
                        .frame(width: 700, height: 1050)
                        .position(x: 650, y: 435)
                        .zIndex(7)
                    Image(socks)
                        .resizable()
                        .frame(width: 700, height: 1050)
                        .position(x: 650, y: 440)
                        .zIndex(6)
                    Image(makeup)
                        .resizable()
                        .frame(width: 700, height: 1050)
                        .position(x: 650, y: 440)
                        .zIndex(6)
                    Image(characterBackground)
                        .resizable()
                        .frame(width: 850, height: 1000)
                        .position(x: 660, y: 500)
                        .zIndex(1)
                    
                    // default
                    if isEyeValue || isHairValue || isClothesValue || isPantsValue || isSocksValue || isMakeupValue || isBackgroundValue {
                        Image("default")
                            .resizable()
                            .frame(width: 100, height: 70)
                            .position(x: 293, y: 780)
                            .zIndex(5)
                    }
                    
                    // face color value
                    if isFaceColorValue {
                        let colors = [
                            ("white", "whiteSkinColor"),
                            ("pink", "pinkSkinColor"),
                            ("blue", "blueSkinColor"),
                            ("orange", "characterDefault"),
                            ("brown", "brownSkinColor"),
                            ("darkBrown", "darkbrownSkinColor"),
                            ("black", "blackSkinColor")
                        ]
                            ForEach(0..<colors.count, id: \.self) { index in
                                let color = colors[index]
                                Image(color.0)
                                    .resizable()
                                    .frame(width: 80, height: 75)
                                    .position(x: CGFloat(300 + index * 105), y: 798)
                                    .zIndex(5)
                                
                                Button(action: {
                                    skinColor = color.1
                                }) {
                                    Color.clear
                                        .frame(width: 80, height: 75)
                                }
                                .position(x: CGFloat(300 + index * 105), y: 798)
                                .zIndex(CGFloat(8) + CGFloat(index))
                            }
                        }

                    // eye value
                    if isEyeValue {
                        let eyeOptions: [(imageName: String, eyeValue: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("eye1", "eye1"),
                            ("eye2", "eye2"),
                            ("eye3", "eye3"),
                            ("eye4", "eye4"),
                            ("eye5", "eye5"),
                            ("eye6", "eye6"),
                            ("eye7", "eye7"),
                            ("eye8", "eye8"),
                            ("eye9", "eye9"),
                            ("eye10", "eye10"),
                            ("eye11", "eye11"),
                            ("eye12", "eye12"),
                            ("eye13", "eye13")
                        ]
                        ForEach(0..<eyeOptions.count, id: \.self) { index in
                            let eyeOption = eyeOptions[index]
                            
                            Image(eyeOption.imageName)
                                .resizable()
                                .frame(width: 450, height: 600)
                                .position(x: 293 + CGFloat(index % 8) * 105, y: 890 + CGFloat(index / 8) * 100)
                                .zIndex(CGFloat(5))
                            
                            Button(action: {
                                eye = eyeOption.eyeValue
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 75)
                            }
                            .position(x: 293 + CGFloat(index % 8) * 105, y: 790 + CGFloat(index / 8) * 100)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }
                    
                    // hair value
                    if isHairValue {
                        let hairOptions: [(imageName: String, hairIdentifier: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("girlHair1", "girlHair1"),
                            ("girlHair2", "girlHair2"),
                            ("girlHair3", "girlHair3"),
                            ("girlHair4", "girlHair4"),
                            ("girlHair5", "girlHair5"),
                            ("girlHair6", "girlHair6"),
                            ("girlHair7", "girlHair7"),
                            ("boyHair1", "boyHair1"),
                            ("boyHair2", "boyHair2"),
                            ("boyHair3", "boyHair3"),
                            ("boyHair4", "boyHair4"),
                            ("boyHair5", "boyHair5"),
                            ("boyHair6", "boyHair6"),
                            ("boyHair7", "boyHair7")
                        ]
                        ForEach(0..<hairOptions.count, id: \.self) { index in
                            let hairOption = hairOptions[index]
                            
                            Image(hairOption.imageName)
                                .resizable()
                                .frame(width: 200, height: 300)
                                .position(x: 290 + CGFloat(index % 8) * 105, y: 830 + CGFloat(index / 8) * 100)
                                .zIndex(5)
                            
                            Button(action: {
                                hair = hairOption.hairIdentifier
                            }) {
                                Color.clear
                                    .frame(width: 100, height: 75)
                            }
                            .position(x: 290 + CGFloat(index % 8) * 105, y: 790 + CGFloat(index / 8) * 100)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }

                    // clothesValue
                    if isClothesValue {
                        let clothesOptions: [(imageName: String, clothesValue: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("clothes1", "clothes1"),
                            ("clothes2", "clothes2"),
                            ("clothes3", "clothes3"),
                            ("clothes4", "clothes4"),
                            ("clothes5", "clothes5"),
                            ("clothes6", "clothes6"),
                            ("clothes7", "clothes7"),
                            ("clothes8", "clothes8"),
                            ("clothes9", "clothes9"),
                            ("clothes10", "clothes10"),
                            ("clothes11", "clothes11"),
                            ("clothes12", "clothes12"),
                            ("clothes13", "clothes13"),
                            ("clothes14", "clothes14")
                        ]
                        
                        ForEach(0..<clothesOptions.count, id: \.self) { index in
                            let clothesOption = clothesOptions[index]
                            
                            Image(clothesOption.imageName)
                                .resizable()
                                .frame(width: 300, height: 400)
                                .position(x: 295 + CGFloat(index % 8) * 105, y: 790 + CGFloat(index / 8) * 110)
                                .zIndex(5)
                            
                            Button(action: {
                                clothes = clothesOption.clothesValue
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 75)
                            }
                            .position(x: 290 + CGFloat(index % 8) * 105, y: 780 + CGFloat(index / 8) * 120)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }
                    
                    // pants value
                    if isPantsValue {
                        let pantsOptions: [(imageName: String, pantsValue: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("pants1", "pants1"),
                            ("pants2", "pants2"),
                            ("pants3", "pants3"),
                            ("pants4", "pants4"),
                            ("pants5", "pants5"),
                            ("pants6", "pants6"),
                            ("pants7", "pants7"),
                            ("pants8", "pants8"),
                            ("pants9", "pants9"),
                            ("pants10", "pants10"),
                            ("pants11", "pants11"),
                            ("pants12", "pants12"),
                            ("pants13", "pants13"),
                            ("pants14", "pants14")
                        ]
                        
                        ForEach(0..<pantsOptions.count, id: \.self) { index in
                            let pantsOption = pantsOptions[index]
                            
                            Image(pantsOption.imageName)
                                .resizable()
                                .frame(width: 300, height: 400)
                                .position(x: 295 + CGFloat(index % 8) * 105, y: 760 + CGFloat(index / 8) * 100)
                                .zIndex(5)
                            
                            Button(action: {
                                pants = pantsOption.pantsValue
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 75)
                            }
                            .position(x: 295 + CGFloat(index % 8) * 105, y: 760 + CGFloat(index / 8) * 100)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }

                    // socks value
                    if isSocksValue {
                        let socksOptions: [(imageName: String, socksValue: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("socks1", "socks1"),
                            ("socks2", "socks2"),
                            ("socks3", "socks3"),
                            ("socks4", "socks4"),
                            ("socks5", "socks5"),
                            ("socks6", "socks6"),
                            ("socks7", "socks7"),
                            ("socks8", "socks8"),
                            ("socks9", "socks9"),
                            ("socks10", "socks10")
                        ]
                        
                        ForEach(0..<socksOptions.count, id: \.self) { index in
                            let socksOption = socksOptions[index]
                            
                            Image(socksOption.imageName)
                                .resizable()
                                .frame(width: 400, height: 600)
                                .position(x: 295 + CGFloat(index % 8) * 105, y: 700 + CGFloat(index / 8) * 110)
                                .zIndex(5)
                            
                            Button(action: {
                                socks = socksOption.socksValue
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 75)
                            }
                            .position(x: 295 + CGFloat(index % 8) * 105, y: 780 + CGFloat(index / 8) * 110)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }

                    // makeup value
                    if isMakeupValue {
                        let makeupOptions: [(imageName: String, makeupValue: String)] = [
                            ("valueDefault", "valueDefault"),
                            ("makeup1", "makeup1"),
                            ("makeup2", "makeup2"),
                            ("makeup3", "makeup3"),
                            ("makeup4", "makeup4"),
                            ("makeup5", "makeup5"),
                            ("makeup6", "makeup6"),
                            ("makeup7", "makeup7"),
                            ("makeup8", "makeup8"),
                            ("makeup9", "makeup9"),
                            ("makeup10", "makeup10")
                        ]
                        
                        ForEach(0..<makeupOptions.count, id: \.self) { index in
                            let makeupOption = makeupOptions[index]
                            
                            Image(makeupOption.imageName)
                                .resizable()
                                .frame(width: 500, height: 500)
                                .position(x: 295 + CGFloat(index % 8) * 105, y: 870 + CGFloat(index / 8) * 110)
                                .zIndex(5)
                            
                            Button(action: {
                                makeup = makeupOption.makeupValue
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 75)
                            }
                            .position(x: 295 + CGFloat(index % 8) * 105, y: 780 + CGFloat(index / 8) * 80)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }

                    // background value
                    if isBackgroundValue {
                        let backgroundOptions: [(imageName: String, backgroundValue: String)] = [
                            ("valueDefault", "defaultBackground"),
                            ("background1", "background1"),
                            ("background2", "background2"),
                            ("background3", "background3"),
                            ("background4", "background4"),
                            ("background5", "background5"),
                            ("background6", "background6"),
                            ("background7", "background7"),
                            ("background8", "background8"),
                            ("background9", "background9")
                        ]
                        
                        ForEach(0..<backgroundOptions.count, id: \.self) { index in
                            let backgroundOption = backgroundOptions[index]
                            
                            Image(backgroundOption.imageName)
                                .resizable()
                                .frame(width: 65, height: 65)
                                .position(x: 290 + CGFloat(index % 8) * 105, y: 780 + CGFloat(index / 8) * 100)
                                .zIndex(5)
                            
                            Button(action: {
                                characterBackground = backgroundOption.backgroundValue
                            }) {
                                Color.clear
                                    .frame(width: 80, height: 75)
                            }
                            .position(x: 290 + CGFloat(index % 8) * 105, y: 780 + CGFloat(index / 8) * 100)
                            .zIndex(CGFloat(8) + CGFloat(index))
                        }
                    }

                    // faceColor Button
                    Image(isFaceColor ? "faceColor" : "faceColorClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 275, y: 665)
                        .padding()
                        .zIndex(7)
                    
                    Button(action: {
                        isFaceColor.toggle()
                        if isEye || isMakeup || isHair || isClothes || isPants || isSocks || isCharacterBackground {
                            isEye = true
                            isMakeup = true
                            isHair = true
                            isClothes = true
                            isPants = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isEye {
                            isEye = true
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true;
                        } else if !isPants {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = true
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 130, height: 100)
                    }
                    .position(x: 305, y: 680)
                    .zIndex(8)
                    
                    // eye Button
                    Image(isEye ? "eye" : "eyeClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 385, y: 665)
                        .padding()
                        .zIndex(6)
                    
                    Button(action: {
                        isEye.toggle()
                        if isFaceColor || isMakeup || isHair || isClothes || isPants || isSocks || isCharacterBackground {
                            isFaceColor = true
                            isMakeup = true
                            isHair = true
                            isClothes = true
                            isPants = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true;
                        } else if !isPants {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = true
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 409, y: 680)
                    .zIndex(8)
                    
                    // makeup Button
                    Image(isMakeup ? "makeup" : "makeupClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 489, y: 665)
                        .padding()
                        .zIndex(6)
                    
                    Button(action: {
                        isMakeup.toggle()
                        if isFaceColor || isEye || isHair || isClothes || isPants || isSocks || isCharacterBackground {
                            isFaceColor = true
                            isEye = true
                            isHair = true
                            isClothes = true
                            isPants = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true;
                        } else if !isPants {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = true
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 519, y: 680)
                    .zIndex(9)
                    
                    // hair Button
                    Image(isHair ? "hair" : "hairClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 599, y: 665)
                        .padding()
                        .zIndex(7)
                    
                    Button(action: {
                        isHair.toggle()
                        if isFaceColor || isEye || isMakeup || isClothes || isPants || isSocks || isCharacterBackground {
                            isFaceColor = true
                            isEye = true
                            isMakeup = true
                            isClothes = true
                            isPants = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isClothes {
                            isClothes = true;
                        } else if !isPants {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = true
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 599, y: 635)
                    .zIndex(8)
                    
                    // clothes Button
                    Image(isClothes ? "clothes" : "clothesClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 699, y: 665)
                        .padding()
                        .zIndex(8)
                    
                    Button(action: {
                        isClothes.toggle()
                        if isFaceColor || isEye || isMakeup || isHair || isPants || isSocks || isCharacterBackground {
                            isFaceColor = true
                            isEye = true
                            isMakeup = true
                            isHair = true
                            isPants = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isPants {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = true
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 699, y: 635)
                    .zIndex(9)
                    
                    // pants Button
                    Image(isPants ? "pants" : "pantsClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 800, y: 665)
                        .padding()
                        .zIndex(9)
                    
                    Button(action: {
                        isPants.toggle()
                        if isFaceColor || isEye || isMakeup || isHair || isClothes || isSocks || isCharacterBackground {
                            isFaceColor = true
                            isEye = true
                            isMakeup = true
                            isHair = true
                            isClothes = true
                            isSocks = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true
                        } else if !isSocks {
                            isSocks = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = true
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 799, y: 635)
                    .zIndex(10)
                    
                    // socks Button
                    Image(isSocks ? "socks" : "socksClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 905, y: 665)
                        .padding()
                        .zIndex(10)
                    
                    Button(action: {
                        isSocks.toggle()
                        if isFaceColor || isEye || isMakeup || isHair || isClothes || isPants || isCharacterBackground {
                            isFaceColor = true
                            isEye = true
                            isMakeup = true
                            isHair = true
                            isClothes = true
                            isPants = true
                            isCharacterBackground = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true
                        } else if !isSocks {
                            isPants = true
                        } else if !isCharacterBackground {
                            isCharacterBackground = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = true
                        isMakeupValue = false
                        isBackgroundValue = false
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 895, y: 665)
                    .zIndex(11)
                    
                    // characterBackground Button
                    Image(isCharacterBackground ? "characterBackground" : "characterBackgroundClick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 100)
                        .position(x: 1015, y: 665)
                        .padding()
                        .zIndex(10)
                    
                    Button(action: {
                        isCharacterBackground.toggle()
                        if isFaceColor || isEye || isMakeup || isHair || isClothes || isPants || isSocks {
                            isFaceColor = true
                            isEye = true
                            isMakeup = true
                            isHair = true
                            isClothes = true
                            isPants = true
                            isSocks = true
                        } else if !isFaceColor {
                            isFaceColor = true
                        } else if !isEye {
                            isEye = true;
                        } else if !isMakeup {
                            isMakeup = true;
                        } else if !isHair {
                            isHair = true;
                        } else if !isClothes {
                            isClothes = true
                        } else if !isSocks {
                            isPants = true
                        } else if !isSocks {
                            isSocks = true
                        } else {}
                        
                        isFaceColorValue = false
                        isEyeValue = false
                        isHairValue = false
                        isClothesValue = false
                        isPantsValue = false
                        isSocksValue = false
                        isMakeupValue = false
                        isBackgroundValue = true
                    }) {
                        Color.clear
                            .frame(width: 110, height: 100)
                    }
                    .position(x: 1010, y: 680)
                    .zIndex(12)
                    
                    // Return button
                    Image("returnButton")
                        .resizable()
                        .frame(width: 80, height: 130)
                        .position(x: 50, y: 50)
                        .zIndex(5)
                    
                    Button(action: {
                        withAnimation {
                            isGameViewVisible = false
                            isButtonContent = true
                        }
                    }) {
                        Color.clear
                            .frame(width: 80, height: 130)
                    }
                    .position(x: 50, y: 50)
                    .zIndex(15)
                }
                    
                // SAVE button
                Image("SAVE")
                    .resizable()
                    .frame(width: 200, height: 100)
                    .position(x: 1200, y: 550)
                    .zIndex(5)
                
                Button(action: {
                    withAnimation {
                        isGameViewVisible = false
                        isButtonLock = true
                    }
                }) {
                    Color.clear
                        .frame(width: 200, height: 100)
                }
                .position(x: 1200, y: 230)
                .zIndex(15)
            }
                
            if (isButtonLock) {
                Lock()
            } else if (isButtonContent) {
                ContentView()
            }
        }
    }
}
