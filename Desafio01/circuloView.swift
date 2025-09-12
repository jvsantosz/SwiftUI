//
//  circuloView.swift
//  Desafio01
//
//  Created by Turma02-14 on 10/09/25.
//

import SwiftUI

struct circuloView: View {
    var body: some View {
        HStack{
            Image("cj")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                .frame(minHeight: 125,maxHeight: 125)
            
            Spacer()
                .frame(width: 10)

            VStack{
                Text("HackaTruck")
                    .foregroundStyle(.red)
                Text("77 Universidades")
                    .foregroundStyle(.blue)
                Text("5 Regiões do Brasil")
                    .foregroundStyle(.orange)
            }
        }
        }
}

#Preview {
    circuloView()
}
