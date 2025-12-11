import SwiftUI

// SVG
struct FaceView: View {
    let params: FaceParams

    static let intrinsicSize = CGSize(width: 800, height: 800)

    // Nested Groups and Shapes

    struct Face: View {
        let params: FaceParams

        struct Mouth: View { // SVGPath

            struct Mouth: Shape {
                static let centerPoint = CGPoint(x: 400, y: 533.333 + (33.333 / 2.0))

                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 300, y: 533.333))
                        path.addCurve(to: CGPoint(x: 400, y: 566.667),
                                      control1: CGPoint(x: 328.346, y: 554.343),
                                      control2: CGPoint(x: 362.82, y: 566.667))
                        path.addCurve(to: CGPoint(x: 500, y: 533.333),
                                      control1: CGPoint(x: 437.18, y: 566.667),
                                      control2: CGPoint(x: 471.653, y: 554.343))
                    }
                }
            }

            var body: some View {
                Mouth()
                    .stroke(Color(red: 0.1098, green: 0.1529, blue: 0.298), style: StrokeStyle(lineWidth: 50, lineCap: .round))
            }
        }

        struct Eye2: View { // SVGPath

            struct Eye2: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 500, y: 366.67))
                        path.addCurve(to: CGPoint(x: 533.333, y: 333.335),
                                      control1: CGPoint(x: 518.409, y: 366.67),
                                      control2: CGPoint(x: 533.333, y: 351.745))
                        path.addCurve(to: CGPoint(x: 500, y: 300),
                                      control1: CGPoint(x: 533.333, y: 314.925),
                                      control2: CGPoint(x: 518.409, y: 300))
                        path.addCurve(to: CGPoint(x: 466.667, y: 333.335),
                                      control1: CGPoint(x: 481.59, y: 300),
                                      control2: CGPoint(x: 466.667, y: 314.925))
                        path.addCurve(to: CGPoint(x: 500, y: 366.67),
                                      control1: CGPoint(x: 466.667, y: 351.745),
                                      control2: CGPoint(x: 481.59, y: 366.67))
                        path.closeSubpath()
                    }
                }
            }

            var body: some View {
                Eye2()
                    .fill(Color(red: 0.1098, green: 0.1529, blue: 0.298))
            }
        }

        struct Pupil2: View { // SVGPath

            struct Pupil2: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 500, y: 342.89))
                        path.addCurve(to: CGPoint(x: 509.556, y: 333.333),
                                      control1: CGPoint(x: 505.278, y: 342.89),
                                      control2: CGPoint(x: 509.556, y: 338.611))
                        path.addCurve(to: CGPoint(x: 500, y: 323.777),
                                      control1: CGPoint(x: 509.556, y: 328.055),
                                      control2: CGPoint(x: 505.278, y: 323.777))
                        path.addCurve(to: CGPoint(x: 490.444, y: 333.333),
                                      control1: CGPoint(x: 494.722, y: 323.777),
                                      control2: CGPoint(x: 490.444, y: 328.055))
                        path.addCurve(to: CGPoint(x: 500, y: 342.89),
                                      control1: CGPoint(x: 490.444, y: 338.611),
                                      control2: CGPoint(x: 494.722, y: 342.89))
                        path.closeSubpath()
                    }
                }
            }

            var body: some View {
                Pupil2()
                    .fill(Color.white)
            }
        }

        struct Eye1: View { // SVGPath

            struct Eye1: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 300, y: 366.67))
                        path.addCurve(to: CGPoint(x: 333.333, y: 333.335),
                                      control1: CGPoint(x: 318.41, y: 366.67),
                                      control2: CGPoint(x: 333.333, y: 351.745))
                        path.addCurve(to: CGPoint(x: 300, y: 300),
                                      control1: CGPoint(x: 333.333, y: 314.925),
                                      control2: CGPoint(x: 318.41, y: 300))
                        path.addCurve(to: CGPoint(x: 266.667, y: 333.335),
                                      control1: CGPoint(x: 281.591, y: 300),
                                      control2: CGPoint(x: 266.667, y: 314.925))
                        path.addCurve(to: CGPoint(x: 300, y: 366.67),
                                      control1: CGPoint(x: 266.667, y: 351.745),
                                      control2: CGPoint(x: 281.591, y: 366.67))
                        path.closeSubpath()
                    }
                }
            }

            var body: some View {
                Eye1()
                    .fill(Color(red: 0.1098, green: 0.1529, blue: 0.298))
            }
        }

        struct Pupil1: View { // SVGPath

            struct Pupil1: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 300, y: 342.892))
                        path.addCurve(to: CGPoint(x: 309.556, y: 333.335),
                                      control1: CGPoint(x: 305.278, y: 342.892),
                                      control2: CGPoint(x: 309.556, y: 338.613))
                        path.addCurve(to: CGPoint(x: 300, y: 323.778),
                                      control1: CGPoint(x: 309.556, y: 328.057),
                                      control2: CGPoint(x: 305.278, y: 323.778))
                        path.addCurve(to: CGPoint(x: 290.444, y: 333.335),
                                      control1: CGPoint(x: 294.722, y: 323.778),
                                      control2: CGPoint(x: 290.444, y: 328.057))
                        path.addCurve(to: CGPoint(x: 300, y: 342.892),
                                      control1: CGPoint(x: 290.444, y: 338.613),
                                      control2: CGPoint(x: 294.722, y: 342.892))
                        path.closeSubpath()
                    }
                }
            }

            var body: some View {
                Pupil1()
                    .fill(Color.white)
            }
        }

        struct Corner4: View { // SVGPath

            struct Corner4: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 733.333, y: 466.667))
                        path.addCurve(to: CGPoint(x: 694.28, y: 694.28),
                                      control1: CGPoint(x: 733.333, y: 592.373),
                                      control2: CGPoint(x: 733.333, y: 655.23))
                        path.addCurve(to: CGPoint(x: 466.667, y: 733.333),
                                      control1: CGPoint(x: 655.23, y: 733.333),
                                      control2: CGPoint(x: 592.373, y: 733.333))
                    }
                }
            }

            var body: some View {
                Corner4()
                    .stroke(Color(red: 0.1098, green: 0.1529, blue: 0.298), style: StrokeStyle(lineWidth: 50, lineCap: .round))
            }
        }

        struct Corner3: View { // SVGPath

            struct Corner3: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 333.333, y: 733.333))
                        path.addCurve(to: CGPoint(x: 105.719, y: 694.28),
                                      control1: CGPoint(x: 207.625, y: 733.333),
                                      control2: CGPoint(x: 144.772, y: 733.333))
                        path.addCurve(to: CGPoint(x: 66.6667, y: 466.667),
                                      control1: CGPoint(x: 66.6667, y: 655.23),
                                      control2: CGPoint(x: 66.6667, y: 592.373))
                    }
                }
            }

            var body: some View {
                Corner3()
                    .stroke(Color(red: 0.1098, green: 0.1529, blue: 0.298), style: StrokeStyle(lineWidth: 50, lineCap: .round))
            }
        }

        struct Corner2: View { // SVGPath

            struct Corner2: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 333.333, y: 66.6667))
                        path.addCurve(to: CGPoint(x: 105.719, y: 105.719),
                                      control1: CGPoint(x: 207.625, y: 66.6667),
                                      control2: CGPoint(x: 144.772, y: 66.6667))
                        path.addCurve(to: CGPoint(x: 66.6667, y: 333.333),
                                      control1: CGPoint(x: 66.6667, y: 144.772),
                                      control2: CGPoint(x: 66.6667, y: 207.625))
                    }
                }
            }

            var body: some View {
                Corner2()
                    .stroke(Color(red: 0.1098, green: 0.1529, blue: 0.298), style: StrokeStyle(lineWidth: 50, lineCap: .round))
            }
        }

        struct Corner1: View { // SVGPath

            struct Corner1: Shape {
                func path(in _: CGRect) -> Path {
                    Path { path in
                        path.move(to: CGPoint(x: 466.667, y: 66.6667))
                        path.addCurve(to: CGPoint(x: 694.28, y: 105.719),
                                      control1: CGPoint(x: 592.373, y: 66.6667),
                                      control2: CGPoint(x: 655.23, y: 66.6667))
                        path.addCurve(to: CGPoint(x: 733.333, y: 333.333),
                                      control1: CGPoint(x: 733.333, y: 144.772),
                                      control2: CGPoint(x: 733.333, y: 207.625))
                    }
                }
            }

            var body: some View {
                Corner1()
                    .stroke(Color(red: 0.1098, green: 0.1529, blue: 0.298), style: StrokeStyle(lineWidth: 50, lineCap: .round))
            }
        }

        var body: some View {
            ZStack(alignment: .topLeading) {
                let centerPoint = FaceView.Face.Mouth.Mouth.centerPoint
                Mouth()
                    .animation(.linear(duration: 1.0)) { view in
                        view
                            .opacity(params.happy ? 1.0 : 0.5)
                            .transformEffect(
                                CGAffineTransform(translationX: centerPoint.x, y: centerPoint.y)
                                    .rotated(by: params.happy ? 0 : Angle(degrees: 180).radians)
                                    .translatedBy(x: -centerPoint.x, y: -centerPoint.y)
                            )
                    }
                Eye2()
                Pupil2()
                    .offset(x: self.params.eyeX)
                Eye1()
                Pupil1()
                    .offset(x: self.params.eyeX)
                Corner4()
                Corner3()
                Corner2()
                Corner1()
            }
        }
    }

    var isResizable = false
    func resizable() -> Self { Self(params: params, isResizable: true) }

    var body: some View {
        if isResizable {
            GeometryReader { proxy in
                Face(params: params)
                    .frame(width: 800, height: 800,
                           alignment: .topLeading)
                    .scaleEffect(x: proxy.size.width / 800,
                                 y: proxy.size.height / 800)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        } else {
            Face(params: params)
                .frame(width: 800, height: 800)
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
            Text("Size: 800.0x800.0").padding(.bottom)
        }
    }
}
