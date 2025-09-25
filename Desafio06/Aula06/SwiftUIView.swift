import SwiftUI

struct Character: Codable, Identifiable {
    let id: String
    let name: String
    let species: String
    let house: String?
    let image: String
}

struct SwiftUIView: View {
    @State private var results = [Character]()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.black, .green]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea().zIndex(0)

            
            VStack {
                Image("SlytherinLG")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                ScrollView {
                        LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(results.filter{ $0.house == "Slytherin"}) { character in
                            HStack {
                                AsyncImage(url: URL(string: character.image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    } else {
                                        ProgressView()
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(character.name)
                                        .font(.headline)
                                    Text(character.house ?? "Sem casa")
                                        .foregroundColor(.black)
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
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Character].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse
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
    SwiftUIView()
}

