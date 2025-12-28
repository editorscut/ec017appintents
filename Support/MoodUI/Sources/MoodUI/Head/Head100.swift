import SwiftUI

public struct Head100: View {
  let emotionValue: Int
  
  public init(emotionValue: Int) {
    self.emotionValue = emotionValue
  }
}

extension Head100 {
  public var body: some View {
    Head(emotionValue: emotionValue)
      .frame(width: 100, height: 100)
  }
}

#Preview {
  Head100(emotionValue: 2)
}
