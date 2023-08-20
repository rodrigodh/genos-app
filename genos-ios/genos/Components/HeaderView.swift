import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Olá Rodrigo")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Image("UserProfileImage").resizable().frame(width: 50.0, height: 50.0).scaledToFit().clipShape(Circle())
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
