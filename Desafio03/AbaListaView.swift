//
//  AbaListaView.swift
//  Desafio03
//
//  Created by Turma02-14 on 22/09/25.
//

import SwiftUI

struct AbaListaView: View {
    var body: some View {
        NavigationView { // Permite a navegação na lista, se necessário
            List {
               NavigationLink("Item",destination: AbaRosaView())
               NavigationLink("Item",destination: AbaAzulView())
               NavigationLink("Item",destination: AbaCinzaView())
            }
            
            
            .navigationTitle("Lista")
        }
    }
}

#Preview {
    AbaListaView()
}
