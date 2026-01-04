import SwiftUI
import MoodModel

public struct AdjustableMood: View {
  var mood: MoodEntry
  
  public init(_ mood: MoodEntry) {
    self.mood = mood
  }
}

extension AdjustableMood {
  public var body: some View {
    VStack {
      EmotionSlider(mood: mood)
      MoodDatePicker(mood: mood)
      DetailModifier(mood: mood)
    }
  }
}


#Preview {
  @Previewable
  @State var mood = moodPreview
  AdjustableMood(mood)
}
