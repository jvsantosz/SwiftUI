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
        }
    }
}

#Preview {
    AbaCinzaView()
}
