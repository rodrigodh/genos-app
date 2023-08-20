import SwiftUI

struct ManageDailyBalanceView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Metric.entity(), sortDescriptors: [], animation: .default) private var metrics: FetchedResults<Metric>

    var todaysMetric: Metric? {
        let currentDate = Date()

        let filteredTodayMetrics = metrics.filter { metric in
            let calendar = Calendar.current

            if metric.date == nil {
                return false
            }

            return calendar.isDate(metric.date!, inSameDayAs: currentDate)
        }

        return filteredTodayMetrics.first
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                CustomBackground()
                VStack(alignment: .leading) {
                    HeaderView()

                    if let metric = todaysMetric {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading) {
                                Text("Gerenciar gastos \(metric.date?.formatted(date: .numeric, time: .omitted) ?? "")")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.textColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 10.0)

                                MoneyGoalView(currentBalance: metric.balance)

                                Text("Adicionar")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.textColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 10.0)

                                HStack {
                                    IncreaseBalanceButtonView(amount: 0.5)
                                    IncreaseBalanceButtonView(amount: 1)
                                }
                                HStack {
                                    IncreaseBalanceButtonView(amount: 5)
                                    IncreaseBalanceButtonView(amount: 10.00)
                                }

                                Text("Remover")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.textColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 10.0)

                                HStack {
                                    IncreaseBalanceButtonView(amount: 0.5, color: Color.loveColor)
                                    IncreaseBalanceButtonView(amount: 1, color: Color.loveColor)
                                }
                                HStack {
                                    IncreaseBalanceButtonView(amount: 5, color: Color.loveColor)
                                    IncreaseBalanceButtonView(amount: 10, color: Color.loveColor)
                                }
                            }
                        }
                    }
                }.padding([.top, .leading, .trailing], 20.0)
            }
        }
    }
}

struct ManageDailyBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let viewContext = persistenceController.container.viewContext

        return ManageDailyBalanceView().environment(\.managedObjectContext, viewContext)
    }
}
