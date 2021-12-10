// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SnapshotTesting
import SwiftUI
import XCTest
@testable import Examples

class ContentViewPreviewTests: XCTestCase {
    func testPreviews_iPhone_InterfaceStyleLight() {
        assertSnapshot(
            matching: ContentView_Previews.previews,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviews_iPhone_InterfaceStyleDark() {
        assertSnapshot(
            matching: ContentView_Previews.previews,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviews_iPadMini_InterfaceStyleLight() {
        assertSnapshot(
            matching: ContentView_Previews.previews,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviews_iPadMini_InterfaceStyleDark() {
        assertSnapshot(
            matching: ContentView_Previews.previews,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark))
        )
    }

}
