import AppIntents
import MoodModel
import SwiftData

struct NewEmotionForLatestMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Open to most recent Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the detail page for the most recently created mood")
  }
  
  static let supportedModes: IntentModes = [.foreground(.immediate)]
  
  @Dependency
  private var navigation: NavigationManager
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    if let mostRecent = mostRecent(for: container).first {
      navigation.path = [mostRecent]
    }
    return .result()
  }
}
