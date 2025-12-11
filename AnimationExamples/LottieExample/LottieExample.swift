//

import Lottie
import SwiftUI

struct LottieExample: View {
    @State var happy = true
    @State var playbackMode = LottiePlaybackMode.paused(at: .progress(0))

    var body: some View {
        LottieView(animation: .named("face"))
            .playbackMode(playbackMode)
            .onTapGesture {
                self.happy.toggle()
                self.playbackMode = .playing(.fromProgress(happy ? 1 : 0, toProgress: happy ? 0 : 1, loopMode: .playOnce))
            }
    }
}

#Preview {
    LottieExample()
}
