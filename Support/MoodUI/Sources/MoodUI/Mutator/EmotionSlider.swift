import SwiftUI
import MoodModel

public struct EmotionSlider: View {
  @Binding public var mood: MoodEntry
  @State private var sliderValue: Double {
    didSet {
      mood.emotion = Emotion(value: sliderValue)
    }
  }
  
  public init(mood: Binding<MoodEntry>) {
    self._mood = mood
    self.sliderValue = Double(mood.wrappedValue.emotionValue)
  }
}

extension EmotionSlider {
  public var body: some View {
    VStack {
      Head(emotionValue: mood.emotionValue)
      Slider(value: $sliderValue, in: -2...2,
             step: 1)
      .padding()
    }
    .padding()
  }
}

#Preview {
  @Previewable
  @State var mood = moodPreview
  EmotionSlider(mood: $mood)
}
