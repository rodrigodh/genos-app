import SwiftUI

extension Color {
    static let baseColor = Color("BaseColor")
    static let surfaceColor = Color("SurfaceColor")
    static let textColor = Color("TextColor")
    static let goldColor = Color("GoldColor")
    static let loveColor = Color("LoveColor")
    static let foamColor = Color("FoamColor")
}

struct CustomBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color.baseColor)
            .edgesIgnoringSafeArea(.all)
    }
}
