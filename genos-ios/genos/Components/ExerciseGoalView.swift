import SwiftUI

struct ExerciseGoalView: View {
    var metric: Metric?
    var updateExercise: () -> Void

    var body: some View {
        let color = metric?.exercise == true ? Color.foamColor : Color.loveColor
        let icon = metric?.exercise == true ? "checkmark.seal.fill" : "xmark.seal.fill"

        VStack(alignment: .leading) {
            HStack {
                Text("Meta de exercício físico")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                    .multilineTextAlignment(.leading)

                Spacer()

                Button(action: updateExercise) {
                    Image(systemName: "rectangle.fill.on.rectangle.angled.fill").resizable().frame(width: 16, height: 16).foregroundColor(Color.goldColor)
                }
            }

            HStack {
                Text(metric?.exercise == true ? "Completo" : "Incompleto")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image(systemName: icon).resizable().frame(width: 24, height: 24).foregroundColor(color)
            }.offset(y: -10)
        }.padding().background(Color.surfaceColor).cornerRadius(10)
    }
}

struct ExerciseGoalView_Previews: PreviewProvider {
    static func example() {
        print("Pressed")
    }

    static var previews: some View {
        ExerciseGoalView(updateExercise: example)
    }
}
