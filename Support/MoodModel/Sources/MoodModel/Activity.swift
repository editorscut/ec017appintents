public let activityDescriptions = Activity.allCases.map(\.rawValue)
public let activities = Activity.allCases
public let defaultActivity = Activity.noneChosen

public enum Activity: String, Codable, Equatable, Sendable, CaseIterable {
  case noneChosen = "<   >"
  case work
  case email
  case online
  case meetings
  case friends
  case shopping
  case finances
  case leisure
  case exercising
  case chores
  case rest
  case other
  
  public static func activity(from activityDescription: String) -> Activity {
    Activity(rawValue: activityDescription) ?? .other
  }
}

extension Activity: Identifiable {
  public var id: Self {
    self
  }
}

extension Activity: CustomStringConvertible {
  public var description: String {
    rawValue
  }
}



