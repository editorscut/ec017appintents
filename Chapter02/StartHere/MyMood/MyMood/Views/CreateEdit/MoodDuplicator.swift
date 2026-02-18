import SwiftUI
import MoodModel
import MoodUI
import SwiftData

struct MoodDuplicator: View {
  @State private var mood: MoodEntry
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  
  init(_ mood: MoodEntry) {
    self.mood = MoodEntry(mood: mood,
                          now: true)
  }
}

extension MoodDuplicator {
  var body: some View {
    VStack {
      AdjustableMood(mood)
      HStack(spacing: 30) {
        Button("Cancel") {
          dismiss()
        }
        Button("Create") {
          context.insert(mood)
          try? context.save()
          dismiss()
        }
        .disabled(mood.detail.isEmpty)
      }
      .padding()
    }
  }
}





