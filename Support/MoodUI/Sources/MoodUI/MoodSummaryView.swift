import SwiftUI
import MoodModel

public struct MoodSummaryView: View {
  public let mood: MoodEntry
  
  public init(mood: MoodEntry) {
    self.mood = mood
  }
}

extension MoodSummaryView {
  public var body: some View {
    VStack {
      Head200(emotionValue: mood.emotionValue)
        .padding()
      MoodDetailView(mood: mood)
        .padding()
    }
  }
}
