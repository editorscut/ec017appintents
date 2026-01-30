import SwiftUI
import SwiftData
import MoodModel
import MoodUI

struct ContentView: View {
  @Query(sort: \MoodEntry.timestamp, order: .reverse)
  private var moods: [MoodEntry]
  @Environment(NavigationManager.self) private var navigation
}

extension ContentView {
  @ViewBuilder
  var body: some View {
    @Bindable var navigation = navigation
    NavigationStack {
      MoodList(moods)
        .toolbar {
          MoodToolbar()
        }
        .navigationTitle("Moods")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $navigation.isCreatingMood) {
          navigation.navigateToRoot()
        } content: {
          MoodCreator(activity: navigation.currentActivity)
        }
    }
  }
}

#Preview(traits: .sampleData) {
  ContentView()
    .environment(NavigationManager())
}
