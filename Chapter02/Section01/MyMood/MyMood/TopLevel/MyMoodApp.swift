import SwiftUI
import SwiftData
import MoodModel

@main
struct MyMoodApp: App {
  @State var navigation = NavigationManager()
  @State var modelContainer: ModelContainer
  
  init() {
    navigation = NavigationManager()
     modelContainer = {
      do {
        return try ModelContainer(for: MoodEntry.self)
      } catch {
        fatalError("Couldn't create container for MoodEntry")
      }
    }()
  }
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
