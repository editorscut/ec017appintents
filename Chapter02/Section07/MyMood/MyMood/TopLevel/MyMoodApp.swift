import SwiftUI
import SwiftData
import MoodModel
import AppIntents

@main
struct MyMoodApp: App {
  @State var navigation: NavigationManager
  @State var modelContainer: ModelContainer
  
  init() {
    let navigation = NavigationManager()
    self.navigation = navigation
    
    let modelContainer = {
      do {
        return try ModelContainer(for: MoodEntry.self)
      } catch {
        fatalError("Couldn't create container for MoodEntry")
      }
    }()
    self.modelContainer = modelContainer
  }
}

extension MyMoodApp {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppIntentExecution(MostRecentDetailIntent.self) { _ in
          navigation.navigateToRoot()
          if let path = mostRecent(for: modelContainer).first {
            navigation.path = [path]
          }
        }
        .onAppIntentExecution(CreateMoodIntent.self) { _ in
          navigation.navigateToRoot()
          navigation.isCreatingMood = true
        }
        .onAppIntentExecution(CreateWorkIntent.self) { _ in
          navigation.navigateToRoot()
          navigation.currentActivity = .work
          navigation.isCreatingMood = true
        }
    }
    .modelContainer(modelContainer)
    .environment(navigation)
  }
}
