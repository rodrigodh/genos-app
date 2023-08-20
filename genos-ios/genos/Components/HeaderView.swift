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

            Image("UserProfileImage").resizable().frame(width: 36.0, height: 36.0).scaledToFill().clipShape(Circle())
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
