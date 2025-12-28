public let emotions = Emotion.allCases
public let defaultEmotion = Emotion.happy
public let minEmotion = Emotion.verySad
public let maxEmotion = Emotion.veryHappy

public enum Emotion: Int, Codable, Equatable, Sendable, CaseIterable {
  case verySad = -2
  case sad
  case ok
  case happy
  case veryHappy
}

extension Emotion {
  public init(value: Double) {
    let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
    self.init(value: roundedValue)
  }
  
  public init(value: Int) {
    let truncatedValue = min(max(value, -2), 2)
    self = Emotion(rawValue: truncatedValue) ?? .ok
  }
  
  public var value: Int {
    rawValue
  }
  
  public var emoji: String {
    return emojis[rawValue + 3]
  }
}

extension Emotion: Identifiable {
  public var id: Self {
    self
  }
}



