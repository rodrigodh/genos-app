import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Metric.entity(), sortDescriptors: [], animation: .default) private var metrics: FetchedResults<Metric>

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                CustomBackground()
                VStack(alignment: .leading) {
                    HeaderView()

                    Text("Metas diárias")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10.0)
                    MoneyGoalProgressView()
                        .padding(.top, 5.0)

                    ExerciseGoalView().padding(.top, 5.0)

                    Text("Histórico")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16.0) {
                            ForEach(metrics) { metric in HistoryCardView(metric: metric) }
                        }
                    }
                }.padding([.top, .leading, .trailing], 20.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let viewContext = persistenceController.container.viewContext

        return HomeView().environment(\.managedObjectContext, viewContext)
    }
}
