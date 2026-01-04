public let emotions = Emotion.allCases.sorted {$0.rawValue < $1.rawValue}
public let defaultEmotion = Emotion.happy
public let minEmotion = Emotion.verySad
public let maxEmotion = Emotion.veryHappy

public enum Emotion: Int, Codable, Equatable, Sendable, CaseIterable {
  case verySad
  case sad
  case ok
  case happy
  case veryHappy
}

extension Emotion {
  public init(value: Double) {
    let roundedValue = Int(value.rounded())
    self.init(value: roundedValue)
  }
  
  public init(value: Int) {
    let truncatedValue = min(max(value, 0), 4)
    self = Emotion(rawValue: truncatedValue) ?? .verySad
  }
  
  public var value: Int {
    rawValue
  }
  
  public var emoji: String {
    return emojis[rawValue]
  }
}

extension Emotion: Identifiable {
  public var id: Self {
    self
  }
}



