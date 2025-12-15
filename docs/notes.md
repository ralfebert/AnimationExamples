* can SwiftUI modifiers be applied to SVGView shape nodes programmatically? (f.e. shadow, or animated modifiers)
* why does a affine transform to scale by y = -1 does not flip the mouth?
* Animate transformEffect (flip/rotate) in SwiftUI didn't work out of the box
* Keyshape: Copy Position (immediately apply it to another element)



* SwiftUI: Animate the change of a path -> yes, use Shape#AnimatableData
* Setup SVGs via Inkscape: How to create reusable elements inside an SVG (defs)
  * yes, we can set it up in Inkscape using Clone (Cmd D), but no, SVGShaper will not pick it up as of now
* Can I configure the coordinate system for elements in an SVG via Inkscape?
  * yes, it's cumbersome to edit/setup; type the transform on the group via XML or use Object » Transform to set it up; maybe related: Settings » Transforms (there's an option to keep them / optimize them - but in my experiment, optimize was ok)
* p3 colors -> Figma -> Keyshape -> Lottie
* Lottie: Player Framework compiled from source without downloading 300mb?
* Flip a path via Keyshape and export as lottie animation



https://medium.com/@anthonycvella/animating-along-a-path-with-keyframe-animator-in-swiftui-1e8acdcace7e

https://medium.com/better-programming/animating-path-drawing-in-swiftui-5708aad900ec

