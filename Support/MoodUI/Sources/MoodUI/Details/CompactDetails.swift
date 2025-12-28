import SwiftUI
import MoodModel

struct CompactDetails: View {
  let mood: MoodEntry
}

extension CompactDetails {
  var body: some View {
    VStack(alignment: .trailing) {
      HStack {
        Text(mood.activityDescription.description.capitalized)
        Text("-")
        Text(mood.detail)
      }
      DateView(timestamp: mood.timestamp)
    }
  }
}

#Preview {
  CompactDetails(mood: moodPreview)
}

