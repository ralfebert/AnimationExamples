import SwiftUI

// SVG
struct FaceView: View {
    let params: FaceParams
    static let intrinsicSize = CGSize(width: 440, height: 440)

    // Nested Groups and Shapes

    struct Corner1: View { // SVGPath

        struct Corner1: Shape {

            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: 140, y: 20))
                    path.addLine(to: CGPoint(x: 80, y: 20))
                    path.addCurve(to: CGPoint(x: 20, y: 80),
                                  control1: CGPoint(x: 46.8629, y: 20),
                                  control2: CGPoint(x: 20, y: 46.8629))
                    path.addLine(to: CGPoint(x: 20, y: 140))
                }
            }
        }

        var body: some View {
            Corner1()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 40, lineCap: .round))
        }
    }

    struct Corner2: View { // SVGPath

        struct Corner2: Shape {

            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: 300, y: 20))
                    path.addLine(to: CGPoint(x: 360, y: 20))
                    path.addCurve(to: CGPoint(x: 420, y: 80),
                                  control1: CGPoint(x: 393.137, y: 20),
                                  control2: CGPoint(x: 420, y: 46.8629))
                    path.addLine(to: CGPoint(x: 420, y: 140))
                }
            }
        }

        var body: some View {
            Corner2()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 40, lineCap: .round))
        }
    }

    struct Corner3: View { // SVGPath

        struct Corner3: Shape {

            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: 140, y: 420))
                    path.addLine(to: CGPoint(x: 80, y: 420))
                    path.addCurve(to: CGPoint(x: 20, y: 360),
                                  control1: CGPoint(x: 46.8629, y: 420),
                                  control2: CGPoint(x: 20, y: 393.137))
                    path.addLine(to: CGPoint(x: 20, y: 300))
                }
            }
        }

        var body: some View {
            Corner3()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 40, lineCap: .round))
        }
    }

    struct Corner4: View { // SVGPath

        struct Corner4: Shape {

            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: 300, y: 420))
                    path.addLine(to: CGPoint(x: 360, y: 420))
                    path.addCurve(to: CGPoint(x: 420, y: 360),
                                  control1: CGPoint(x: 393.137, y: 420),
                                  control2: CGPoint(x: 420, y: 393.137))
                    path.addLine(to: CGPoint(x: 420, y: 300))
                }
            }
        }

        var body: some View {
            Corner4()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 40, lineCap: .round))
        }
    }

    struct Mouth: View { // SVGPath
        let happy: Bool

        struct Mouth: Shape {
            var scaleY: CGFloat

            var animatableData: CGFloat {
                get {
                    self.scaleY
                }
                set {
                    self.scaleY = newValue
                }
            }

            func path(in rect: CGRect) -> Path {
                Path { path in
                    path.move(to: CGPoint(x: -60, y: scaleY * -10))
                    path.addCurve(to: CGPoint(x: 60, y: scaleY * -10),
                                  control1: CGPoint(x: -27.019, y: scaleY * 23.333),
                                  control2: CGPoint(x: 27.019, y: scaleY * 23.333))
                }
                .offsetBy(dx: 220, dy: 290)
            }
        }

        var body: some View {
            Mouth(scaleY: self.happy ? 1 : -1)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .animation(.snappy, value: self.happy)
        }
    }

    struct Eye_l: View {

        static let intrinsicSize = CGSize(width: 60, height: 60)
        static let origin = CGPoint(x: 120, y: 140)

        var body: some View {
            Circle()
                .fill(Color.black)
        }
    }

    struct Pupil_l: View {

        static let intrinsicSize = CGSize(width: 20, height: 20)
        static let origin = CGPoint(x: 140, y: 160)

        var body: some View {
            Circle()
                .fill(Color.white)
        }
    }

    struct Eye_r: View {

        static let intrinsicSize = CGSize(width: 60, height: 60)
        static let origin = CGPoint(x: 260, y: 140)

        var body: some View {
            Circle()
                .fill(Color.black)
        }
    }

    struct Pupil_r: View {

        static let intrinsicSize = CGSize(width: 20, height: 20)
        static let origin = CGPoint(x: 280, y: 160)

        var body: some View {
            Circle()
                .fill(Color.white)
        }
    }

    var isResizable = false
    func resizable() -> Self { Self(params: params, isResizable: true) }

    var body: some View {
        if isResizable {
            GeometryReader { proxy in
                ZStack(alignment: .topLeading) {
                    Corner1()
                    Corner2()
                    Corner3()
                    Corner4()
                    Mouth(happy: params.happy)
                    Eye_l()
                        .frame(width: 60, height: 60, alignment: .topLeading)
                        .padding(.leading, 120)
                        .padding(.top, 140)
                    Pupil_l()
                        .frame(width: 20, height: 20, alignment: .topLeading)
                        .padding(.leading, 140 + self.params.eyeX)
                        .padding(.top, 160)
                    Eye_r()
                        .frame(width: 60, height: 60, alignment: .topLeading)
                        .padding(.leading, 260)
                        .padding(.top, 140)
                    Pupil_r()
                        .frame(width: 20, height: 20, alignment: .topLeading)
                        .padding(.leading, 280 + self.params.eyeX)
                        .padding(.top, 160)
                }
                .frame(width: 440, height: 440,
                       alignment: .topLeading)
                .scaleEffect(x: proxy.size.width / 440,
                             y: proxy.size.height / 440)
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        } else {
            ZStack(alignment: .topLeading) {
                Corner1()
                Corner2()
                Corner3()
                Corner4()
                Mouth(happy: params.happy)
                Eye_l()
                    .frame(width: 60, height: 60, alignment: .topLeading)
                    .padding(.leading, 120)
                    .padding(.top, 140)
                Pupil_l()
                    .frame(width: 20, height: 20, alignment: .topLeading)
                    .padding(.leading, 140)
                    .padding(.top, 160)
                Eye_r()
                    .frame(width: 60, height: 60, alignment: .topLeading)
                    .padding(.leading, 260)
                    .padding(.top, 140)
                Pupil_r()
                    .frame(width: 20, height: 20, alignment: .topLeading)
                    .padding(.leading, 280)
                    .padding(.top, 160)
            }
            .frame(width: 440, height: 440)
        }
    }
}

struct Group1_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            FaceView(params: .init())
                .resizable()
                .frame(width: FaceView.intrinsicSize.width,
                       height: FaceView.intrinsicSize.height)
                .background(Color.clear.border(Color.green))
                .padding()
            Text("Size: 440.0x440.0").padding(.bottom)
        }
    }
}
