import SwiftUI

struct MoneyGoalView: View {
    var currentBalance: Float

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Meta diária")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            Text("Atual: R$\(String(format: "%.2f", currentBalance))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.textColor)

            Text("Atual: R$\(String(format: "%.2f", metricsBalanceGoal))")
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
        var currentBalance = 10.0
        MoneyGoalView(currentBalance: Float(currentBalance))
    }
}
