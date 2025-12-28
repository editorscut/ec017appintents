import SwiftUI

struct Eye: View {
  let frame: CGRect
}

extension Eye {
  var body: some View {
    Circle()
      .frame(width: frame.height/16,
             height: frame.height/16, alignment: .top)
      .padding(.horizontal, frame.width/8)
  }
}

#Preview {
  Head(emotionValue: 1)
}
