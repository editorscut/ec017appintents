import SwiftUI
import MoodModel

public struct MoodItemByDate: View {
  let mood: MoodEntry
  
  public init(mood: MoodEntry) {
    self.mood = mood
  }
}

extension MoodItemByDate {
  public var body: some View {
    HStack {
      Text(mood.emoji)
        .font(.largeTitle)
        .padding(.trailing)
      VStack(alignment: .leading) {
        Text(mood.activityDescription)
          .font(.headline)
        
      }
      Spacer()
      
      VStack(alignment: .trailing) {
        Text(mood.timestamp, style: .time)
        Text(mood.detail)
          .lineLimit(1)
          .font(.caption)
      }
    }
  }
}

#Preview {
  List {
    MoodItemByDate(mood: moodPreview)
  }
}
