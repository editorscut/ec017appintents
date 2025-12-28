public enum EmotionFilter {
  case isHappy
  case isOK
  case isSad
  case isAny
}

extension EmotionFilter {
  public var mood: (MoodEntry) -> Bool {
    switch self {
    case .isHappy: {mood in [Emotion.happy, .veryHappy].contains(mood.emotion)}
    case .isOK: {mood in mood.emotion == .ok}
    case .isSad: {mood in [Emotion.sad, .verySad].contains(mood.emotion)}
    case .isAny: {_ in true}
    }
  }
}
