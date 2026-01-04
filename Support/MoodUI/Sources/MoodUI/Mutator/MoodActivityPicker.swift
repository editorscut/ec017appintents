import SwiftUI
import MoodModel

struct MoodActivityPicker: View {
  var mood: MoodEntry
  
  @State private var activityDescription: String
  
  public init(mood: MoodEntry) {
    self.mood = mood
    self.activityDescription
    = mood.activityDescription
  }
}

extension MoodActivityPicker {
  var body: some View {
      Picker("Activity", selection: $activityDescription) {
        ForEach(activities.map(\.description), id: \.self) { activity in
          Text(activity)
        }
      }
        .pickerStyle(.menu)
    .padding()
    .onAppear {
      activityDescription = mood.activityDescription
    }
    .onChange(of: activityDescription){ _, newValue in
      mood.activity = Activity.activity(from: newValue)
    }
  }
}
