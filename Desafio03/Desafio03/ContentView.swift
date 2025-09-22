
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Aba 1
            AbaRosaView()
                .tabItem {
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
            
            // Aba 2
            AbaAzulView()
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed")
                }
            
            // Aba 3
            AbaCinzaView()
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            
            // Aba 4
            AbaListaView()
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}


