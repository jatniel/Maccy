import Defaults
import SwiftUI

struct HistoryItemView: View {
  @Bindable var item: HistoryItemDecorator

  @Environment(AppState.self) private var appState

  var body: some View {
    if item.isVisible {
      ListItemView(
        id: item.id,
        image: item.thumbnailImage ?? ColorImage.from(item.title),
        attributedTitle: item.attributedTitle,
        title: item.title,
        shortcuts: item.shortcuts,
        isSelected: item.isSelected
      )
      .onTapGesture {
        appState.history.select(item)
      }
      .popover(isPresented: $item.showPreview, arrowEdge: .trailing) {
        PreviewItemView(item: item)
      }
    }
  }
}