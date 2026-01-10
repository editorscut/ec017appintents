import SwiftUI
import SwiftData
import MoodModel

@main
struct MyMoodApp: App {
  @State var modelContainer: ModelContainer = {
    do {
      return try ModelContainer(for: MoodEntry.self)
    } catch {
      fatalError("Couldn't create container for MoodEntry")
    }
  }()
  @State var navigation = NavigationManager()
}

extension MyMoodApp {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(modelContainer)
    .environment(navigation)
  }
}
