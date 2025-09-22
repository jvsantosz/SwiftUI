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
        }
    }
}

#Preview {
    AbaAzulView()
}
