import Observation

@MainActor
@Observable class NavigationManager {
  var modifyingState: ModifyingState?
  var isCreatingMood: Bool = false
}

extension NavigationManager {
  func navigateToRoot() {
    isCreatingMood = false
    modifyingState = nil
  }
}
