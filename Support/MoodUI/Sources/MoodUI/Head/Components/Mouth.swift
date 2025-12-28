import SwiftUI

struct Mouth: View {
  let emotionValue: Int
  let frame: CGRect
}

extension Mouth {
  var body: some View {
    mouthShape(in: self.frame)
      .stroke(style: StrokeStyle(lineWidth: frame.height / 64, lineCap: .round))
  }
}

extension Mouth {
  private func mouthShape(in frame: CGRect) -> Path {
    let verticalOffset = frame.height / 8
    var path = Path()
    path.move(to: CGPoint(x: frame.minX + frame.width / 8,
                          y: frame.midY + verticalOffset))
    path.addQuadCurve(to: CGPoint(x: frame.maxX - frame.width / 8,
                               y: frame.midY + verticalOffset),
                      control: CGPoint(x: frame.midX,
                                       y: frame.midY + verticalOffset +
                                       Double(emotionValue) * frame.height / 7 ))
    return path
  }
}


#Preview {
  Head(emotionValue: -2)
}


