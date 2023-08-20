import SwiftUI


struct CustomBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color.baseColor)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView: View {
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
                    
                    MoneyGoalView()
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
                            HistoryCardView()
                            HistoryCardView()
                            HistoryCardView()
                        }
                    }
                    }.padding([.top, .leading, .trailing], 20.0)
                    
                }
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
