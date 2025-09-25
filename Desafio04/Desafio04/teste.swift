//
//  teste.swift
//  Desafio04
//
//  Created by Turma02-14 on 15/09/25.
//

import SwiftUI

struct teste: View {
    var body: some View {
        ZStack{
            
            
            VStack {
                
                Spacer()
                
                //            musica(id: 0, name: "Love Story", artista: "Taylor Swift", capa: "cj"),
                Image("cj")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    .padding()
                
                Text("Love Story")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
                
                Text("Taylor Swift")
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
                
                Spacer()
            }
            
        }}
}

#Preview {
    teste()
}
