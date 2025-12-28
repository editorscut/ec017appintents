public let emojis = ["😢","☹️", "😐", "😊", "😁"]

public func emoji(for emotionValue: Int) -> String {
  switch emotionValue {
  case ...(-2): "😢"
  case 2...: "😁"
  default: emojis[emotionValue]
  }
}

