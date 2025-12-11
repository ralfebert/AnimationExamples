//

import RiveRuntime
import SwiftUI

class RiveProgressBar: RiveViewModel {
    var progress: Double {
        didSet {
            setInput("Energy", value: progress)
        }
    }

    init(_ initialProgress: Double = 0) {
        progress = initialProgress
        super.init(fileName: "energy_bar_example", stateMachineName: "State Machine ", fit: .scaleDown)
    }

    override func view() -> AnyView {
        AnyView(
            super.view()
                .aspectRatio(4, contentMode: .fill)
        )
    }
}
