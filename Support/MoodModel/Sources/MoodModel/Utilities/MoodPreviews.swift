import Foundation

@MainActor
public let moodPreview = MoodEntry(emotion: .happy,
                                   activity: .online,
                                   detail: "Searching for recipes",
                                   timestamp: Date.now)

@MainActor
public let moodsPreview = {
  var moods: [MoodEntry] = []
  var details = ["Some activity", "Another activity",
                 "One more thing",
                 "Helping out"]
  for i in 0...20 {
    moods.append(MoodEntry(emotion: emotions[i % emotions.count],
                           activity: activities[i % activities.count],
                           detail: details[(i % details.count)],
                           timestamp: Date.now.addingTimeInterval(-30000 * Double(i))))
  }
  return moods
}()
