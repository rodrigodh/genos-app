import SwiftUI

struct ExerciseGoalView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meta de exercício físico")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.textColor)
                .multilineTextAlignment(.leading)

            HStack {
                Text("Completo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.foamColor)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image(systemName: "checkmark.seal.fill").resizable().frame(width: 24, height: 24).foregroundColor(.foamColor)
            }.offset(y: -10)

        }.padding().background(Color.surfaceColor).cornerRadius(10)
    }
}

struct ExerciseGoalView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGoalView()
    }
}
