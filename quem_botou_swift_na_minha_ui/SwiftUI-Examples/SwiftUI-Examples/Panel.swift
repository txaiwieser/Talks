import SwiftUI

public struct PanelModifier: ViewModifier {
    @State private var panelPosition: PanelPosition = .partiallyRevealed

    public enum PanelPosition {
        case open
        case partiallyRevealed
    }

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            self.createBody(for: content, and: geometry)
        }
    }

    private func createBody(for content: Content, and geometry: GeometryProxy) -> some View {
        var position: CGPoint
        switch panelPosition {
        case .open:
            position = CGPoint(
                x: geometry.size.width/2,
                y: geometry.size.height/2 + 400
            )
        case .partiallyRevealed:
            position = CGPoint(
                x: geometry.size.width/2,
                y: 1.5 * geometry.size.height - 54
            )
        }

        return content
            .frame(width: geometry.size.width, height: geometry.size.height)
            .cornerRadius(10)
            .shadow(radius: 8)
            .position(position)
            .onTapGesture {
                withAnimation(.spring()) {
                    self.panelPosition = self.panelPosition == .open ? .partiallyRevealed : .open
                }
        }
    }
}

public extension View {
    func panel() -> some View {
        self.modifier(PanelModifier())
    }
}
