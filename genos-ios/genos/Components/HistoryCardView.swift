import SwiftUI

struct HistoryCardView: View {
    var metric: Metric

    var body: some View {
        let rawPercentage = (metric.balance / metricsBalanceGoal) * 100
        let balanceGoalPercentage = String(format: "%.1f", rawPercentage)

        let isBalanceGoalReached = metric.balance < metricsBalanceGoal

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

                Image(systemName: metric.exercise ? "checkmark.seal.fill" : "xmark.seal.fill").resizable().frame(width: 16, height: 16).foregroundColor(metric.exercise ? .foamColor : .loveColor)
            }.offset(y: -10)

        }.padding().background(Color.surfaceColor).cornerRadius(10)
    }
}
