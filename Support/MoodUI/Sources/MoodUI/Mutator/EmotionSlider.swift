import SwiftUI
import MoodModel

public struct EmotionSlider: View {
  public var mood: MoodEntry
  @State private var sliderValue: Double
  
  public init(mood: MoodEntry) {
    self.mood = mood
    self.sliderValue = Double(mood.emotionValue)
  }
}

extension EmotionSlider {
  public var body: some View {
    VStack {
      Head(emotionValue: mood.emotionValue)
      Slider(value: $sliderValue,
             in: 0...4,
             step: 1)
      .padding()
    }
    .padding()
    .onChange(of: sliderValue, initial: false) {
      mood.emotion = Emotion(value: sliderValue)
    }
  }
}
