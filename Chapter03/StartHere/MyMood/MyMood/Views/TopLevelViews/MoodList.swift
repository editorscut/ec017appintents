import SwiftUI
import SwiftData
import MoodModel
import MoodUI
import AppIntents

public struct MoodList: View {
  private var sections: [Date: [MoodEntry]]
  @Environment(\.modelContext) private var context
  @AppStorage("displayCreateMoodTip") private var displaySiriTip = true
  
  
  public init(_ moods: [MoodEntry]) {
    sections = Dictionary(grouping: moods,
                          by: {Calendar.current.startOfDay(for: $0.timestamp)})
  }
}

extension MoodList {
  public var body: some View {
    List {
      SiriTipView(intent: CreateMoodIntent(),
                  isVisible: $displaySiriTip)
      ForEach(sections.map(\.key).sorted(by: >),
              id: \.self) { section in
        Section(header: Text(section, style: .date)) {
          ForEach(sections[section]!) { mood in
            NavigationLink(value: mood) {
              MoodItemByDate(mood: mood)
            }
          }
          .onDelete { offsets in
            if let index = offsets.first,
               let currentSection = sections[section]{
              context.delete(currentSection[index])
              try? context.save()
            }
          }
        }
      }
    }
    .navigationDestination(for: MoodEntry.self) { mood in
      MoodDetail(mood: mood)
    }
  }
}

#Preview {
  List {
    MoodList(moodsPreview)
  }
}
