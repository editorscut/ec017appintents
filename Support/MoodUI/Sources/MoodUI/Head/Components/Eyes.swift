import SwiftUI

struct Eyes: View {
  let frame: CGRect
}

extension Eyes {
  var body: some View {
    HStack {
      Eye(frame: frame)
      Eye(frame: frame)
    }
    .padding(.bottom, frame.height / 3)
  }
}

#Preview {
  Head(emotionValue: 0)
}
