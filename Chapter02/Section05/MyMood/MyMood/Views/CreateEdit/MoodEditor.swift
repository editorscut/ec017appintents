import SwiftUI
import MoodModel
import MoodUI
import SwiftData

struct MoodEditor: View {
  @State private var mood: MoodEntry
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  
  init(_ mood: MoodEntry) {
    self.mood = mood
  }
}

extension MoodEditor {
  var body: some View {
    VStack {
      AdjustableMood(mood)
      HStack(spacing: 30) {
        Button("Cancel") {
          dismiss()
        }
        Button("Apply") {
          try? context.save()
          dismiss()
        }
        .disabled(mood.detail.isEmpty)
      }
      .padding()
    }
  }
}





