import SwiftUI
import MoodModel

struct MoodDetailView: View {
  let mood: MoodEntry
}

extension MoodDetailView {
  var body: some View {
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

