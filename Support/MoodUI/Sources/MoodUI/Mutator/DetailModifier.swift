import SwiftUI
import MoodModel

public struct DetailModifier: View {
  @Binding public var mood: MoodEntry
  @State private var detail: String {
    didSet {
      mood.detail = detail
    }
  }
  
  public init(mood: Binding<MoodEntry>) {
    self._mood = mood
    self.detail = mood.wrappedValue.detail
  }
}

extension DetailModifier {
  public var body: some View {
    TextField("Add Detail",
              text: $detail)
    .multilineTextAlignment(.center)
    .textFieldStyle(.roundedBorder)
    .padding()
  }
}

#Preview {
  @Previewable
  @State var mood = moodPreview
  DetailModifier(mood: $mood)
}
