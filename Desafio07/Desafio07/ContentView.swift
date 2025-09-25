
import SwiftUI


struct Carro: Codable, Identifiable {
    let id: Int
    let carro: String
    let ano: Int
    let ar_condicionado: Bool
    let direcao_hidraulica: Bool
    let imagem: String
}
struct ContentView: View {
    @State private var carros = [Carro]()
    
    var body: some View {
                    
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack {
                Image("LogoCarros") // Pode ser um logo do app ou placeholder
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(carros) { carro in
                            
                            HStack(spacing: 15) {
                                AsyncImage(url: URL(string: carro.imagem)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } else if phase.error != nil {
                                        Image(systemName: "car.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(10)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(width: 80, height: 50)
                                .cornerRadius(5)
                                
                                VStack(alignment: .leading) {
                                    Text(carro.carro)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("Ano: \(carro.ano)")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                    HStack {
                                        Text(carro.ar_condicionado ? "Ar: Sim" : "Ar: Não")
                                        Text(carro.direcao_hidraulica ? "Direção: Sim" : "Direção: Não")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .onAppear(perform: loadData)
        }
            }
        
        func loadData() {
            guard let url = URL(string: "http://127.0.0.1:1880/hackatruckjoao1") else {
                print("URL inválida")
                return
            }
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode([Carro].self, from: data) {
                        DispatchQueue.main.async {
                            self.carros = decodedResponse
                        }
                        return
                    } else {
                        print("Decoding Failed")
                    }
                }
                print("Fetch Failed: \(error?.localizedDescription ?? "Unknown Error").")
            }.resume()
        }
    }


#Preview {
    ContentView()
}

