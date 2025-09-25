import SwiftUI

struct DuckResponse: Codable {
    let url: String
    let message: String
}

struct ContentView: View {
    @State private var duck: DuckResponse? = nil
    
    var body: some View {
        ZStack{
            Color(.vine).opacity(0.8)
                .ignoresSafeArea()
        VStack {
            if let duck = duck {
               
                AsyncImage(url: URL(string: duck.url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 5)
                    } else if phase.error != nil {
                        Text("Erro ao carregar imagem")
                            .foregroundColor(.red)
                    } else {
                        ProgressView()
                    }
                }
            } else {
                ProgressView("Carregando pato...")
            }
        }
    }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://random-d.uk/api/v2/random?format=json") else {
            print("URL inválida")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(DuckResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.duck = decodedResponse
                    }
                    return
                } else {
                    print("Falha ao decodificar JSON")
                }
            }
            print("Falha na requisição: \(error?.localizedDescription ?? "Erro desconhecido")")
        }.resume()
    }
}

#Preview {
    ContentView()
}

