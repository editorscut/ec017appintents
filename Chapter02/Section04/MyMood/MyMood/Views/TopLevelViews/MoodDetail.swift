import SwiftUI
import MoodModel
import MoodUI

struct MoodDetail: View {
  let mood: MoodEntry
  @Environment(NavigationManager.self) private var navigation
}

extension MoodDetail {
  @ViewBuilder
  var body: some View {
    @Bindable var navigation = navigation
    VStack {
      Spacer()
      MoodSummaryView(mood: mood)
      Spacer()
      HStack(spacing: 40) {
        Button("Edit") {
          navigation.modifyingState = .editing
        }
        Button("Duplicate") {
          navigation.modifyingState = .duplicating
        }
      }
      .fixedSize()
      Spacer()
    }
    .sheet(item: $navigation.modifyingState) {
      navigation.navigateToRoot()
    } content: { item in
      switch (navigation.modifyingState!) {
      case .duplicating: MoodDuplicator(mood)
      case .editing: MoodEditor(mood)
      }
    }
    .navigationTitle(mood.activityDescription.capitalized)
  }
}

#Preview {
  NavigationStack {
    MoodDetailView(mood: moodPreview)
      .environment(NavigationManager())
  }
}

