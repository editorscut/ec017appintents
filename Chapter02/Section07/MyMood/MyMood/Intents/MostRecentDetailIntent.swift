import AppIntents

struct MostRecentDetailIntent: TargetContentProvidingIntent {
  static let title = LocalizedStringResource("Open to most recent Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the detail page for the most recently created mood")
  }
  
  static let supportedModes: IntentModes = [.foreground(.immediate)]
}
