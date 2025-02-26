import SwiftUI

class Character: ObservableObject {
    @Published var skinColor: String = "whiteSkinColor"
    @Published var eye: String = "valueDefault"
    @Published var hair: String = "valueDefault"
    @Published var clothes: String = "valueDefault"
    @Published var pants: String = "valueDefault"
    @Published var socks: String = "valueDefault"
    @Published var makeup: String = "valueDefault"
    @Published var background: String = "defaultBackground"
}
