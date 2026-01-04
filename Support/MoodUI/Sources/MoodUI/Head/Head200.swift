import SwiftUI

public struct Head200: View {
  let emotionValue: Int
  
  public init(emotionValue: Int) {
    self.emotionValue = emotionValue
  }
}

extension Head200 {
  public var body: some View {
    Head(emotionValue: emotionValue)
      .frame(width: 200, height: 200)
  }
}

#Preview {
  Head100(emotionValue: 0)
}
