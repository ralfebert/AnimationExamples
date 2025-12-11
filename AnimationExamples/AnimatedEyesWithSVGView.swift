
import SVGView
import SwiftUI

struct AnimatedEyesWithSVGView: View {
    @State var face = SVGParser.parse(contentsOf: Bundle.main.url(forResource: "face", withExtension: "svg")!)!
    @State var params = AnimationParams()

    struct AnimationParams: Hashable {
        var eyeX: CGFloat = 0
        var happy = true
    }

    var body: some View {
        SVGView(svg: face)
            .contentShape(Rectangle())
            .onTapGesture {
                self.params.happy.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.params.eyeX = gesture.translation.width / 30.0
                    }
                    .onEnded { _ in
                        self.params.eyeX = 0
                    }
            )
            .onChange(of: params, initial: true) { _, _ in
                self.updateSvg()
            }
    }

    func updateSvg() {
        let delta = CGAffineTransform(translationX: params.eyeX, y: 0)
        face.getNode(byId: "eye1")!.transform = delta
        face.getNode(byId: "eye2")!.transform = delta
        let mouth = face.getNode(byId: "mouth")!
        let center = CGPoint(x: mouth.bounds().midX, y: mouth.bounds().midY)
        mouth.transform = CGAffineTransform(translationX: center.x, y: center.y).rotated(by: params.happy ? 0 : .pi).translatedBy(x: -center.x, y: -center.y)
    }
}

#Preview {
    AnimatedEyesWithSVGView()
}
