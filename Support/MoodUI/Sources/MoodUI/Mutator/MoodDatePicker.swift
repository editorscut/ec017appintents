import SwiftUI
import MoodModel
import Foundation

struct MoodDatePicker: View {
  var mood: MoodEntry
  @State private var date: Date 
  
  public init(mood: MoodEntry) {
    self.mood = mood
    self.date = mood.timestamp
  }
}

extension MoodDatePicker {
  var body: some View {
    DatePicker(selection: $date) {
      MoodActivityPicker(mood: mood)
    }
    .padding()
    .padding(.horizontal)
    .onChange(of: date){ _, newValue in
      mood.timestamp = newValue
    }
  }
}
