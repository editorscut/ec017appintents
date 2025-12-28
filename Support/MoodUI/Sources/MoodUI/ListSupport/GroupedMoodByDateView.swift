import SwiftUI
import MoodModel

struct GroupedMoodByDateView: View {
  private var sections: [Date: [MoodEntry]]

  
  init(moods: [MoodEntry]) {
    sections = Dictionary(grouping: moods,
                          by: {Calendar.current.startOfDay(for: $0.timestamp)})
  }
  
}


extension GroupedMoodByDateView {
  var body: some View {
    ForEach(sections.map(\.key).sorted(by: >), id: \.self) { section in
      Section(header: Text(section, style: .date)) {
        ForEach(sections[section]!) { mood in
          NavigationLink(value: mood){
            MoodItemByDateView(mood: mood)
          }
        }
      }
    }
  }
}

#Preview {
    List {
      GroupedMoodByDateView(moods: moodsPreview)
    }
}
