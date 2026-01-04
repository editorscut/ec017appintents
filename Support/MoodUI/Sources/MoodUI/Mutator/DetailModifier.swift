import SwiftUI
import MoodModel

public struct DetailModifier: View {
  public var mood: MoodEntry
  @State private var detail: String 
  
  public init(mood: MoodEntry) {
    self.mood = mood
    self.detail = mood.detail
  }
}

extension DetailModifier {
  public var body: some View {
    TextField("Add Detail",
              text: $detail)
    .multilineTextAlignment(.center)
    .textFieldStyle(.roundedBorder)
    .padding()
    .onChange(of: detail) { _, newValue in
      mood.detail = detail
    }
  }
}
