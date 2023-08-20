import SwiftUI

struct MoneyGoalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Meta diária")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            Text("Atual: R$20,00")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.textColor)

            Text("Meta: R$60,00")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.goldColor)
        }.padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.surfaceColor)
            .cornerRadius(8)
    }
}

struct MoneyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGoalView()
    }
}
