
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
        face.getNode(byId: "pupil1")!.transform = delta
        face.getNode(byId: "pupil2")!.transform = delta
        let mouth = face.getNode(byId: "mouth")! as! SVGPath
        let center = CGPoint(x: mouth.bounds().midX, y: mouth.bounds().midY)
        mouth.stroke = .init(fill: faceParams.happy ? SVGColor.black : SVGColor(0xAAAAAA), width: 20)
        mouth.transform = CGAffineTransform(translationX: center.x, y: center.y).rotated(by: faceParams.happy ? 0 : .pi).translatedBy(x: -center.x, y: -center.y)
    }
}

#Preview {
    AnimatedEyesWithSVGView()
}
