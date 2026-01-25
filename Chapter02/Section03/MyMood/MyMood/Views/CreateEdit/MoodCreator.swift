import SwiftUI
import MoodModel
import MoodUI
import SwiftData

struct MoodCreator: View {
  @State private var mood = MoodEntry()
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  
}

extension MoodCreator {
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
        .disabled(mood.activity  == defaultActivity ||
                  mood.detail.isEmpty)
      }
      .padding()
    }
  }
}



