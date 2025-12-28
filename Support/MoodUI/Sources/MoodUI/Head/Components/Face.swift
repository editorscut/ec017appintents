import SwiftUI

struct Face: View {
  let emotionValue: Int
  let frame: CGRect
}

extension Face {
  var body: some View {
    Circle()
      .foregroundStyle(.yellow)
      .frame(width: frame.width, height: frame.height)
  }
}

#Preview {
  Head(emotionValue: 2)
}
