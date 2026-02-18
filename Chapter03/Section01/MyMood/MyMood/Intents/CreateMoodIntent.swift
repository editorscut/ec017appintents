import AppIntents

struct CreateMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Open and Create a Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet")
  }
  
  static let supportedModes: IntentModes = [.foreground(.immediate)]
  
  @Dependency
  private var navigation: NavigationManager
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    navigation.isCreatingMood = true
    return .result()
  }
}

