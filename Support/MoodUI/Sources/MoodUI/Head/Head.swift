import SwiftUI

public struct Head: View {
  let emotionValue: Int
  
  public init(emotionValue: Int) {
    self.emotionValue = emotionValue
  }
}

extension Head {
  public var body: some View {
    GeometryReader { proxy in
      let frame = proxy.frame(in: .local)
      ZStack {
        Face(emotionValue: emotionValue,
             frame: frame)
        Eyes(frame: frame)
        Mouth(emotionValue: emotionValue,
              frame: frame)
      }
    }
    .padding()
    .aspectRatio(1.0, contentMode: .fit)
  }
}

#Preview {
  Head(emotionValue: 1)
}
