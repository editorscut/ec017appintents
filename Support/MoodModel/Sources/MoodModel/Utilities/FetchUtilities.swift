import SwiftData
import Foundation

public func moods(for container: ModelContainer) -> [MoodEntry] {
  let context = ModelContext(container)
  let sortDescriptor = [SortDescriptor(\MoodEntry.timestamp,
                                        order: .reverse)]
  let fetchDescriptor = FetchDescriptor<MoodEntry>(sortBy: sortDescriptor)
  return (try? context.fetch(fetchDescriptor)) ?? [MoodEntry]()
}

public func mostRecent(_ number: Int = 1,
                       for container: ModelContainer,
                       emotionFilter: EmotionFilter = .isAny,
                       activityFilter: ActivityFilter) -> [MoodEntry] {
  Array(moods(for: container)
    .filter(emotionFilter.mood)
    .filter(activityFilter.mood)
    .prefix(number))
}


