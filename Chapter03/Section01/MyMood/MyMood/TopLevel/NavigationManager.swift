import Observation
import MoodModel

@MainActor
@Observable class NavigationManager {
  var modifyingState: ModifyingState?
  var isCreatingMood: Bool = false
  
  var currentActivity = defaultActivity
  var path: [MoodEntry] = []
}

extension NavigationManager {
  func navigateToRoot() {
    isCreatingMood = false
    modifyingState = nil
    currentActivity = defaultActivity
    path = []
  }
}
