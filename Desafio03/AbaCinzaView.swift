//
//  AbaCinzaView.swift
//  Desafio03
//
//  Created by Turma02-14 on 22/09/25.
//

import SwiftUI

struct AbaCinzaView: View {
    var body: some View {
        ZStack {
            
            Color.gray.edgesIgnoringSafeArea(.all)
            Image(systemName: "paintpalette.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.black)
            
            VStack{
                
                Spacer().frame(height: 750)
                
                Rectangle()
                    .fill(.white)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
            }
        }
    }
}

#Preview {
    AbaCinzaView()
}
