import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    )
    
    struct Location: Hashable, Identifiable {
        let id = UUID()
        let nome: String
        let foto: String
        let descricao: String
        let latitude: Double
        let longitude: Double
    }
    
    let localizacoes = [
        Location(nome: "Cristo Redentor", foto: "https://dynamic-media.tacdn.com/media/photo-o/30/33/90/d9/caption.jpg?w=700&h=500&s=1", descricao: "Um dos pontos turísticos mais famosos do Brasil.", latitude: -22.9519, longitude: -43.2105),
        Location(nome: "Cataratas do Iguaçu", foto: "https://www.destino.foz.br/wp-content/uploads/2023/06/Cataratas-do-Iguacu-1024x683.jpeg", descricao: "Maravilha natural localizada no Paraná, Brasil.", latitude: -25.6953, longitude: -54.4367),
        Location(nome: "Chapada Diamantina", foto: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Chapada_Diamantina_Panorama.jpg", descricao: "Parque nacional na Bahia, cheio de trilhas e cachoeiras.", latitude: -12.8034, longitude: -41.3244),
        
        Location(nome: "Torre Eiffel", foto: "eiffel", descricao: "O ícone mais famoso de Paris e da França.", latitude: 48.8584, longitude: 2.2945),
        Location(nome: "Coliseu de Roma", foto: "coliseu", descricao: "Anfiteatro icônico da Roma Antiga.", latitude: 41.8902, longitude: 12.4922),
        Location(nome: "Estátua da Liberdade", foto: "liberdade", descricao: "Presente da França aos EUA, símbolo de liberdade.", latitude: 40.6892, longitude: -74.0445),
        Location(nome: "Taj Mahal", foto: "tajmahal", descricao: "Mausoléu de mármore na Índia, símbolo de amor eterno.", latitude: 27.1751, longitude: 78.0421),
        Location(nome: "Muralha da China", foto: "muralha", descricao: "Construção histórica que se estende por milhares de km.", latitude: 40.4319, longitude: 116.5704),
        Location(nome: "Machu Picchu", foto: "machu", descricao: "Antiga cidade inca localizada nos Andes peruanos.", latitude: -13.1631, longitude: -72.5450),
        Location(nome: "Pirâmides de Gizé", foto: "piramides", descricao: "As pirâmides mais famosas do Egito, incluindo a Grande Pirâmide de Quéops.", latitude: 29.9792, longitude: 31.1342),
        
        Location(nome: "Big Ben", foto: "bigben", descricao: "O relógio mais famoso de Londres.", latitude: 51.5007, longitude: -0.1246),
        Location(nome: "Sagrada Família", foto: "sagrada", descricao: "Basílica projetada por Gaudí em Barcelona.", latitude: 41.4036, longitude: 2.1744),
        Location(nome: "Ópera de Sydney", foto: "opera", descricao: "Símbolo da Austrália, famosa por sua arquitetura única.", latitude: -33.8568, longitude: 151.2153),
        Location(nome: "Monte Everest", foto: "everest", descricao: "A montanha mais alta do mundo.", latitude: 27.9881, longitude: 86.9250),
        Location(nome: "Monte Fuji", foto: "fuji", descricao: "A montanha mais icônica do Japão.", latitude: 35.3606, longitude: 138.7274),
        
        Location(nome: "Stonehenge", foto: "stonehenge", descricao: "Monumento pré-histórico na Inglaterra.", latitude: 51.1789, longitude: -1.8262),
        Location(nome: "Chichén Itzá", foto: "chichen", descricao: "Cidade maia famosa pela pirâmide El Castillo.", latitude: 20.6843, longitude: -88.5678),
        Location(nome: "Angkor Wat", foto: "angkor", descricao: "O maior templo religioso do mundo, no Camboja.", latitude: 13.4125, longitude: 103.8670),
        Location(nome: "Petra", foto: "petra", descricao: "Cidade arqueológica esculpida na rocha, na Jordânia.", latitude: 30.3285, longitude: 35.4444),
        Location(nome: "Monte Rushmore", foto: "rushmore", descricao: "Escultura com os rostos de presidentes dos EUA.", latitude: 43.8791, longitude: -103.4591)
    ]

    
    @State private var localizacaoSelecionada: Location? = nil
    @State private var mostrarSheet = false
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(localizacoes) { location in
                    Annotation(location.nome,
                               coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(.black)
                                .onTapGesture {
                                    localizacaoSelecionada = location
                                    mostrarSheet = true
                                }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            VStack {
                Picker("Localização", selection: $localizacaoSelecionada) {
                    ForEach(localizacoes) { local in
                        Text(local.nome).tag(local as Location?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(.gray.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onChange(of: localizacaoSelecionada) { _, novaLocalizacao in
                    if let novaLocalizacao = novaLocalizacao {
                        position = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: novaLocalizacao.latitude, longitude: novaLocalizacao.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                            )
                        )
                    }
                }
                
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 70)
                        .foregroundColor(.gray.opacity(0.9))
                        .cornerRadius(12)
                    
                    VStack {
                        Text("Maravilhas do Brasil")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .padding()
        }
        // Apresenta um Sheet quando mostrarSheet for true
        .sheet(isPresented: $mostrarSheet) {
            if let local = localizacaoSelecionada {
                DetalheView(local: local)
            }
        }
    }
}



#Preview {
    ContentView()
}

