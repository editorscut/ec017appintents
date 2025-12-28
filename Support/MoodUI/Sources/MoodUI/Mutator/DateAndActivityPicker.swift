import SwiftUI
import MoodModel
import Foundation

struct DateAndActivityPicker: View {
  @Binding var mood: MoodEntry
  @State private var date: Date {
    didSet {
      mood.timestamp = date
    }
  }
  @State private var activityDescription: String {
    didSet {
      mood.activity = Activity.activity(from: activityDescription)
    }
  }
  
  public init(mood: Binding<MoodEntry>) {
    self._mood = mood
    self.date = mood.wrappedValue.timestamp
    self.activityDescription
    = mood.wrappedValue.activityDescription
  }
}

extension DateAndActivityPicker {
  var body: some View {
    DatePicker(selection: $date) {
      Picker(selection: $activityDescription) {
        ForEach(activities) { activity in
          Text(activity.description)
        }
      } label: {Text("Activity List")}
        .pickerStyle(.wheel)
    }
    .padding()
  }
}

#Preview {
  @Previewable
  @State var mood = moodPreview
  DateAndActivityPicker(mood: $mood)
  
}
