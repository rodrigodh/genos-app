import SwiftUI

struct ManageDailyBalanceView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Metric.entity(), sortDescriptors: [], animation: .default) private var metrics: FetchedResults<Metric>

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                CustomBackground()
                VStack(alignment: .leading) {
                    HeaderView()

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text("Gerenciar gastos 20/08")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.textColor)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 10.0)

                            MoneyGoalView()

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
