import SwiftData
import SwiftUI
import MoodModel

struct SampleData: PreviewModifier {
  static func makeSharedContext() throws -> ModelContainer {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    do {
      let container = try ModelContainer(for: MoodEntry.self, configurations: config)
      try addSampleData(to: container)
      return container
    } catch {
      fatalError("Couldn't create container: \(error.localizedDescription)")
    }
  }
  
  func body(content: Content, context: ModelContainer) -> some View {
    content.modelContainer(context)
  }
}

extension PreviewTrait where T == Preview.ViewTraits {
  @MainActor
  static var sampleData: Self = .modifier(SampleData())
}

@MainActor
fileprivate func addSampleData(to container: ModelContainer) throws {
  let context = ModelContext(container)
  for mood in moodsPreview {
    context.insert(mood)
  }
  try context.save()
}
