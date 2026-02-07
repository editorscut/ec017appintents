enum ModifyingState {
  case duplicating
  case editing
}

extension ModifyingState: Identifiable {
  var id: Self {
    self
  }
}

