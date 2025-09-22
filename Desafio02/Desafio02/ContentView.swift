//
//  ContentView.swift
//  Desafio02
//
//  Created by Turma02-14 on 11/09/25.
//

import SwiftUI

struct ContentView: View {
    @State public var distance:Double = 0.0
    @State public var tempo:Double = 0.0
    @State public var result:Double = 0.0

    var body: some View {
        
        ZStack{
            
            Color(trocarCor( result:result))
                .ignoresSafeArea()
            
            VStack {
                
                
                
                Text("Digite a distância (km)")
                
                TextField("Digite a distancia", value:$distance, format: .number)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: 200,height: 70)
                
                
                Text("Digite o tempo(h)")
                
                Spacer().frame(height:5)
                
                TextField("Digite a distancia", value:$tempo, format: .number)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: 200,height: 70)
                
                
                VStack{
                    HStack{
                        Button("Calcular") {
                            
                            result = distance/tempo
                        }
                        
                    }
                }
                
                Spacer()
                
                trocarImagem(result: result)
                
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                    .frame(minHeight: 200,maxHeight: 200)
                
                Spacer()

                                

                
                ZStack{
                    Rectangle()
                        .frame(width:280 ,height:180 )
                        .cornerRadius(20)
                    
                    Spacer().frame(height: 20)
                    VStack{
                        HStack{
                            Text("TARTARUGA  (0-9.9Km/h)")
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .fill(.green)
                                .frame(width: 15 ,height: 15)
                                .cornerRadius(20)
                            
                                
                        }
                        HStack{
                            Text("ELEFANTE  (10-29.9.9 Km/h)")
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 15 ,height: 15)
                                .cornerRadius(20)
                            
                                
                        }
                        HStack{
                            Text("AVESTRUZ  (30-69.9 Km/h)")
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .fill(.orange)
                                .frame(width: 15 ,height: 15)
                                .cornerRadius(20)
                            
                                
                        }
                        HStack{
                            Text("LEÃO  (70-89.9 Km/h)")
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .fill(.yellow)
                                .frame(width: 15 ,height: 15)
                                .cornerRadius(20)
                            
                                
                        }
                        HStack{
                            Text("GUEPARDO  (90-130 Km/h)")
                                .foregroundStyle(.white)
                            
                            Rectangle()
                                .fill(.red)
                                .frame(width: 15 ,height: 15)
                                .cornerRadius(20)
                            
                                
                        }




                }
                
            }

            }
            
        }
    }
    
    func trocarCor(result:Double)->Color{
        switch result {
            
        case 0.1...9.9:
            return.green
            
        case 10.0...39.0:
            return.blue
            
        case 40.0...79.0:
            return.orange
            
        case 80.0...99.0:
            return.yellow
            
        default:
            
            
            return.gray
            
        }
    }
    
    func trocarImagem(result:Double)->Image{
        switch result {
            
        case 0.1...9.9:
            return Image("taruga")
            
        case 10.0...39.0:
            return Image("elefante")
            
        case 40.0...79.0:
            return Image("avestruz")

        case 80.0...89.0:
            return Image("leao")
            
        case 90.0...100:
            return Image("guepardo")
        default:
            
            
            return Image("cj")
            
        }
    }


}

#Preview {
    ContentView()
}
