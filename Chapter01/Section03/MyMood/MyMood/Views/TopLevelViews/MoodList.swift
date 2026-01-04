import SwiftUI
import SwiftData
import MoodModel
import MoodUI

public struct MoodList: View {
  private var sections: [Date: [MoodEntry]]
  @Environment(\.modelContext) private var context

  
  public init(_ moods: [MoodEntry]) {
    sections = Dictionary(grouping: moods,
                          by: {Calendar.current.startOfDay(for: $0.timestamp)})
  }
}

extension MoodList {
  public var body: some View {
    ForEach(sections.map(\.key).sorted(by: >),
            id: \.self) { section in
      Section(header: Text(section, style: .date)) {
        ForEach(sections[section]!) { mood in
          NavigationLink {
            MoodDetail(mood: mood)
          } label: {
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
}

#Preview {
    List {
      MoodList(moodsPreview)
    }
}
