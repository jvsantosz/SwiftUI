//
//  DetalheView.swift
//  Desafio05
//
//  Created by Turma02-14 on 16/09/25.
//

import SwiftUI

struct DetalheView: View {
    let local: ContentView.Location
    
    var body: some View {
        ZStack{
            
            Color(.gray).opacity(0.9)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                AsyncImage(url: URL(string:local.foto))
                    .scaledToFit()
                    .frame(width: 350,height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text(local.nome)
                    .font(.title)
                    .bold()
                ScrollView{
                    
                    Text(local.descricao)
                        .padding()
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
