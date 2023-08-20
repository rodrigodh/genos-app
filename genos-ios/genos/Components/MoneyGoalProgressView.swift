import SwiftUI

struct MoneyGoalProgressView: View {
    var metric: Metric?

    var percentage: Float {
        let metricBalance = metric?.balance ?? 0
        let percentageTotal = (metricBalance / metricsBalanceGoal)

        return percentageTotal
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Meta monetária")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            Text("\(String(format: "%.0f", percentage * 100))% / R$\(String(format: "%.2f", metricsBalanceGoal))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.goldColor)
                .multilineTextAlignment(.leading)

            ProgressView(value: percentage)
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
