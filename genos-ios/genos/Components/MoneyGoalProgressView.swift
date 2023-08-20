import SwiftUI

struct MoneyGoalProgressView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meta monetária")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            Text("95% / R$60,00")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.goldColor)
                .multilineTextAlignment(.leading)

            ProgressView(value: 0.8)
                .progressViewStyle(.linear)
                .accentColor(Color.loveColor)
                .foregroundColor(Color.goldColor)

        }.padding().background(Color.surfaceColor).cornerRadius(10)
    }
}

struct MoneyGoalProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGoalProgressView()
    }
}
