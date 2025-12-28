import SwiftUI
import MoodModel

struct AdjustableMood: View {
  @Binding var mood: MoodEntry
  
  public init(_ mood: Binding<MoodEntry>) {
    self._mood = mood
  }
}

extension AdjustableMood {
  var body: some View {
    VStack {
      EmotionSlider(mood: $mood)
      DateAndActivityPicker(mood: $mood)
      DetailModifier(mood: $mood)
    }
  }
}


#Preview {
  @Previewable
  @State var mood = moodPreview
  AdjustableMood($mood)
}
