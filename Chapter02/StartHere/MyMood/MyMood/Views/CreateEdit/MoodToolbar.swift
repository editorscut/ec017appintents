import SwiftUI

struct MoodToolbar: ToolbarContent {
  @Environment(NavigationManager.self) private var navigation
}

extension MoodToolbar {
  @ToolbarContentBuilder
  var body: some ToolbarContent {
    ToolbarItem(placement: .topBarLeading) {
      EditButton()
    }
    ToolbarItem(placement: .primaryAction) {
      Button {
        navigation.isCreatingMood = true
      } label: {
        Image(systemName: "plus")
      }
    }
  }
}
