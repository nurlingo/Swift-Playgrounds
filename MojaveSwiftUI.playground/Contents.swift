//: A SwiftUI based Playground for playing with fonts
  
import SwiftUI
import PlaygroundSupport

struct CustomContentView: View {
    var body: some View {
        GreatingView()
    }
}

struct GreatingView: View {
    var body: some View {
        
        VStack (spacing: 12) {
            
            Text("Salam alaikum").font(.system(.title, design: .monospaced))
            
            Text("How are you? Life's going well?").font(.system(.body, design: .monospaced)).lineLimit(nil).multilineTextAlignment(.center)
            
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView: CustomContentView())
