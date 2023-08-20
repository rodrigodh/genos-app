import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Início")
                }
            ManageDailyBalanceView()
                .tabItem {
                    Image(systemName: "scroll.fill")
                    Text("Gasto")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
