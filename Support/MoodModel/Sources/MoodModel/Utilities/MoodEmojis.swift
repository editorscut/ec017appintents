public let emojis = ["😢","☹️", "😐", "😊", "😁"]

public func emoji(for emotionValue: Int) -> String {
  switch emotionValue {
  case ...(0): "😢"
  case 0...: "😁"
  default: emojis[emotionValue]
  }
}

