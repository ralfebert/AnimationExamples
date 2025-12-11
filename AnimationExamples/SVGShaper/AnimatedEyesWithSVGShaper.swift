import SwiftUI

struct AnimatedEyesWithSVGShaper: View {
    @State var faceParams = FaceParams()
    var body: some View {
        FaceView(params: faceParams)
            .resizable()
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
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .padding()
    }
}

#Preview {
    AnimatedEyesWithSVGShaper()
}
