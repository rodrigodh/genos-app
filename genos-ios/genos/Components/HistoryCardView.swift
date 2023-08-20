import SwiftUI

struct HistoryCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("19/08/2023")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            HStack {
                Text("Meta monetária: 95%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                    .multilineTextAlignment(.leading)

                Image(systemName: "checkmark.seal.fill").resizable().frame(width: 16, height: 16).foregroundColor(.foamColor)
            }

            HStack {
                Text("Meta de exercício físico: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                    .multilineTextAlignment(.leading)

                Image(systemName: "checkmark.seal.fill").resizable().frame(width: 16, height: 16).foregroundColor(.foamColor)
            }.offset(y: -10)

        }.padding().background(Color.surfaceColor).cornerRadius(10)
    }
}

struct HistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCardView()
    }
}
