import SwiftUI
import MoodModel
import Foundation

struct DateView: View {
  let timestamp: Date
}

extension DateView {
  var body: some View {
    HStack {
      Text(timestamp, style: .time)
      Text(timestamp, style: .date)
    }
  }
}

#Preview {
  DateView(timestamp: Date.now)
}

