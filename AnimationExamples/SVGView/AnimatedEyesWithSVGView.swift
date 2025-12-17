
import SVGView
import SwiftUI

struct AnimatedEyesWithSVGView: View {
    @State var face = SVGParser.parse(contentsOf: Bundle.main.url(forResource: "face", withExtension: "svg")!)!
    @State var faceParams = FaceParams()

    var body: some View {
        SVGView(svg: face)
            .contentShape(Rectangle())
            .onTapGesture {
                self.faceParams.happy.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.faceParams.eyeX = gesture.translation.width / 30.0
                    }
                    .onEnded { _ in
                        self.faceParams.eyeX = 0
                    }
            )
            .onChange(of: faceParams, initial: true) { _, _ in
                withAnimation {
                    self.updateSvg()
                }
            }
    }

    func updateSvg() {
        let delta = CGAffineTransform(translationX: faceParams.eyeX, y: 0)
        face.getNode(byId: "pupil_l")!.transform = delta
        face.getNode(byId: "pupil_r")!.transform = delta
        let mouth = face.getNode(byId: "mouth")! as! SVGPath
        mouth.transform = mouth.transform.scaledBy(x: 1, y: faceParams.happy ? 1 : -1)
    }
}

#Preview {
    AnimatedEyesWithSVGView()
}
