import AppIntents

struct MoodShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(intent: CreateMoodIntent(),
                phrases: [
                  "Open and Create \(.applicationName)",
                  "\(.applicationName) open and create a new mood"
                ],
                shortTitle: "New mood",
                systemImageName: "square.and.pencil")
    AppShortcut(intent: CreateTopActivityIntent(),
                phrases: [
                  "Open and Create Work \(.applicationName)",
                  "\(.applicationName) open and create a new work mood"
                ],
                shortTitle: "Work mood",
                systemImageName: "person.badge.shield.checkmark")
    AppShortcut(intent: NewEmotionForLatestMoodIntent(),
                phrases: [
                  "Open to the latest \(.applicationName)",
                  "\(.applicationName) open to my latest mood"
                ],
                shortTitle: "Most recent",
                systemImageName: "calendar.badge.plus")
  }
}
