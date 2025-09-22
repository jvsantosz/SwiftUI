import SwiftUI

struct AbaAzulView: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            Image(systemName:"paintbrush.pointed")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.black)
            
            VStack{
                
                Spacer().frame(height: 800)
                
                Rectangle()
                    .fill(.white)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
            }
        }
    }
}

#Preview {
    AbaAzulView()
}
