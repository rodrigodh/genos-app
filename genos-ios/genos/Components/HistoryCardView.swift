import SwiftUI

struct HistoryCardView: View {
    var metric: Metric
    var balanceGoalPercentage: String = ""
    var isBalanceGoalReached: Bool = false

    init(metric: Metric) {
        self.metric = metric
        isBalanceGoalReached = metric.balance < metricsBalanceGoal
        calculateBalanceGoalPercentage()
    }

    mutating func calculateBalanceGoalPercentage() {
        let rawPercentage = (metric.balance / metricsBalanceGoal) * 100
        let removeDecimalPlaces = String(format: "%.1f", rawPercentage)
        balanceGoalPercentage = removeDecimalPlaces
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(metric.date?.formatted(date: .numeric, time: .omitted) ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            HStack {
                Text("Meta monetária: \(balanceGoalPercentage)%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                    .multilineTextAlignment(.leading)

                Image(systemName: isBalanceGoalReached ? "checkmark.seal.fill" : "xmark.seal.fill").resizable().frame(width: 16, height: 16).foregroundColor(isBalanceGoalReached ? .foamColor : .loveColor)
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
