import AppIntents

struct CreateWorkIntent: TargetContentProvidingIntent {
  static let title = LocalizedStringResource("Open and Create a Work Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet with the activity set to 'work'")
  }
  
  static let supportedModes: IntentModes = [.foreground(.immediate)]
}

