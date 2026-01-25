import SwiftData
import Foundation

@Model
public class MoodEntry {
  public var emotion: Emotion
  public var activity: Activity
  public var detail: String
  public var timestamp: Date
  
  public init(emotion: Emotion = defaultEmotion,
              activity: Activity = defaultActivity,
              detail: String = "",
              timestamp: Date = Date.now) {
    self.emotion = emotion
    self.timestamp = timestamp
    self.activity = activity
    self.detail = detail
  }
  
  public init(mood: MoodEntry,
              now: Bool = false) {
    self.emotion = mood.emotion
    self.activity = mood.activity
    self.detail = mood.detail
    self.timestamp = now ? Date.now : mood.timestamp
  }
}

extension MoodEntry {
  public var emoji: String {
    emotion.emoji
  }
  
  public var emotionValue: Int {
    get { emotion.value}
    set { emotion = Emotion(value: newValue) }
  }
  
  public var activityDescription: String {
    activity.description
  }
}

extension MoodEntry: Identifiable {
  public var id: Int {
    timestamp.hashValue
  }
}
