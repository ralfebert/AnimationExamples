//

import SwiftUI

struct RiveExampleView: View {
    @StateObject private var rprogress = RiveProgressBar()
    @State var health: Double = 0

    var body: some View {
        VStack {
            Text("RiveProgressBar:")
            rprogress.view()

            Slider(value: Binding(
                get: {
                    health
                },
                set: { newVal in
                    health = newVal
                    rprogress.progress = health
                }
            ), in: 0 ... 100)
                .padding(.leading).padding(.trailing)
        }
    }
}

#Preview {
    RiveExampleView()
}
