import AppIntents

struct DisappointingIntent: AppIntent {
  static let title: LocalizedStringResource = "Example intent"
  
  static var description: IntentDescription {
    IntentDescription("This intent does nothing but display a dialog.")
  }
  
  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: "Finished running intent")
  }
}

