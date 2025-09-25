import SwiftUI

struct MusicaDetalhaView: View {
    var musica: ContentView.musica
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [.black, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea().zIndex(0)
            
            VStack {
                Image(musica.capa)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    .padding()
                
                Text(musica.name)
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
                
                Text(musica.artista)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                HStack{
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                    
                    
                }
                
                Spacer().frame(height: 20)
                
                Rectangle().frame(width: 300, height:5)
                
                
                
            }
        }
            .navigationTitle(musica.name) // título no topo
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

