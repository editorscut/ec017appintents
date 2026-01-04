import SwiftUI
import MoodModel

public struct MoodDetailView: View {
  let mood: MoodEntry
  
  public init(mood: MoodEntry) {
    self.mood = mood
  }
}

extension MoodDetailView {
  public var body: some View {
    VStack {
      Text(mood.activityDescription.description.capitalized)
        .font(.title)
      DateView(timestamp: mood.timestamp)
        .padding()
      Text(mood.detail)
        .foregroundStyle(.secondary)
    }
  }
}

#Preview {
  MoodDetailView(mood: moodPreview)
}

