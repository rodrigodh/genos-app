import SwiftUI

struct UpdateBalanceButtonView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var updateMetric: (_ amount: Float) -> Bool
    var amount: Float
    var color = Color.goldColor

    var body: some View {
        Button(action: {
            updateMetric(amount)
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

struct UpdateBalanceButtonView_Previews: PreviewProvider {
    static func example(amount: Float) -> Bool {
        print("Pressed")
        return true
    }

    static var previews: some View {
        UpdateBalanceButtonView(updateMetric: example, amount: 10.00)
    }
}
