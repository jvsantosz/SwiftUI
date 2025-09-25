//
//  ContentView.swift
//  Desafio04
//
//  Created by Turma02-14 on 15/09/25.
//

import SwiftUI

struct ContentView: View {
    
    struct musica : Identifiable{
        var  id:Int
        var name:String
        var artista:String
        var capa:String
    }
    
    var arrayMusicas = [
        musica(id: 0, name: "Love Story", artista: "Taylor Swift", capa: "capa00"),
            musica(id: 1, name: "You Belong With Me", artista: "Taylor Swift", capa: "capa2"),
            musica(id: 2, name: "All Too Well (10 Minute Version)", artista: "Taylor Swift", capa: "capa3"),
            musica(id: 3, name: "Shake It Off", artista: "Taylor Swift", capa: "capa4"),
            musica(id: 4, name: "Blank Space", artista: "Taylor Swift", capa: "capa5"),
            musica(id: 5, name: "Wildest Dreams", artista: "Taylor Swift", capa: "capa6"),
            musica(id: 6, name: "Style", artista: "Taylor Swift", capa: "capa7"),
            musica(id: 7, name: "Enchanted", artista: "Taylor Swift", capa: "capa8"),
            musica(id: 8, name: "Back To December", artista: "Taylor Swift", capa: "capa9"),
            musica(id: 9, name: "Cardigan", artista: "Taylor Swift", capa: "capa10"),
            musica(id: 10, name: "Willow", artista: "Taylor Swift", capa: "capa11"),
            musica(id: 11, name: "Exile (feat. Bon Iver)", artista: "Taylor Swift", capa: "capa12"),
            musica(id: 12, name: "Anti-Hero", artista: "Taylor Swift", capa: "capa13"),
            musica(id: 13, name: "Bejeweled", artista: "Taylor Swift", capa: "capa14"),
            musica(id: 14, name: "Lavender Haze", artista: "Taylor Swift", capa: "capa15"),
            musica(id: 15, name: "Cruel Summer", artista: "Taylor Swift", capa: "capa16"),
            musica(id: 16, name: "The Archer", artista: "Taylor Swift", capa: "capa17"),
            musica(id: 17, name: "Delicate", artista: "Taylor Swift", capa: "capa18"),
            musica(id: 18, name: "Look What You Made Me Do", artista: "Taylor Swift", capa: "capa19"),
            musica(id: 19, name: "Mine", artista: "Taylor Swift", capa: "capa20")
    ]
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                LinearGradient(
                    gradient: Gradient(colors: [.black, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea().zIndex(0)
                VStack {
                    ScrollView{
                        
                        Image("swift")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        HStack{
                            Spacer().frame(width: 0)
                            Text("Minha PlayList")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                            Spacer().frame(height: 100)
                        }
                        
                        ForEach(arrayMusicas) { item in
                            NavigationLink(destination:MusicaDetalhaView(musica: item)){
                                
                                HStack {
                                    Image(item.capa)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(6)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name).bold()
                                        Text(item.artista)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                }
                
            }
        }}
}
#Preview {
    ContentView()
}
