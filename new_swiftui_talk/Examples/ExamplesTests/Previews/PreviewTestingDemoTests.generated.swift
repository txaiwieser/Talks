// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SnapshotTesting
import SwiftUI
import XCTest
@testable import Examples

class PreviewTestingDemoPreviewTests: XCTestCase {
    func testPreviewPage1Main_iPhone_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Main,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage1Main_iPhone_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Main,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage1Main_iPadMini_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Main,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage1Main_iPadMini_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Main,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage1Detail_iPhone_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Detail,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage1Detail_iPhone_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Detail,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage1Detail_iPadMini_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Detail,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage1Detail_iPadMini_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage1Detail,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage2FalseA_iPhone_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2FalseA,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage2FalseA_iPhone_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2FalseA,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage2FalseA_iPadMini_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2FalseA,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage2FalseA_iPadMini_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2FalseA,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage2TrueB_iPhone_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2TrueB,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage2TrueB_iPhone_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2TrueB,
            as: .image(layout: .device(config: .iPhoneX), traits: .init(userInterfaceStyle: .dark))
        )
    }

    func testPreviewPage2TrueB_iPadMini_InterfaceStyleLight() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2TrueB,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light))
        )
    }

    func testPreviewPage2TrueB_iPadMini_InterfaceStyleDark() {
        assertSnapshot(
            matching: PreviewTestingDemo_Previews.previewPage2TrueB,
            as: .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark))
        )
    }

}
