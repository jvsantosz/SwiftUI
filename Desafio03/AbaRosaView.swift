//
//  AbaRosaView.swift
//  Desafio03
//
//  Created by Turma02-14 on 22/09/25.
//
import SwiftUI

struct AbaRosaView: View {
    var body: some View {
        ZStack {
            Color.pink.edgesIgnoringSafeArea(.all)
            Image(systemName: "paintbrush.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.black)
        }
    }
}

#Preview{
    AbaRosaView()
}
