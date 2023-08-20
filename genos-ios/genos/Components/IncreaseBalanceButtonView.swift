import SwiftUI

struct IncreaseBalanceButtonView: View {
    var amount: Float
    var color = Color.goldColor

    var body: some View {
        Button(action: {
            // Action to perform when the button is tapped
        }) {
            VStack(alignment: .leading, spacing: 8) {
                Text("R$\(String(format: "%.2f", amount))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.surfaceColor)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(color)
            .cornerRadius(8)
        }
    }
}

struct IncreaseBalanceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        IncreaseBalanceButtonView(amount: 10.00)
    }
}
