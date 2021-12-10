//
//  PreviewTestingDemo.swift
//  Examples
//
//  Created by Txai Wieser on 25/08/20.
//  Copyright © 2020 Txai Wieser. All rights reserved.
//

import SwiftUI

// MARK: - View

struct PreviewTestingDemo: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        TabView(
            selection: $viewModel.state.selectedTab,
            content:  {
                page1.tag(ViewModel.State.Tab.page1)
                page2.tag(ViewModel.State.Tab.page2)
            }
        )
    }

    var page1: some View {
        NavigationView {
            List {
                NavigationLink(
                    "Detail",
                    destination: Text("Detail").navigationTitle("Detail"),
                    isActive: $viewModel.state.page1.isDetailActive
                )
            }
            .navigationTitle("Page 1")
        }
        .tabItem { Label("Page 1", systemImage: "triangle.fill") }
    }

    var page2: some View {
        NavigationView {
            Form {
                Toggle("Toggle", isOn: $viewModel.state.page2.value1)
                Picker(
                    selection: $viewModel.state.page2.value2,
                    label: Text("Picker"),
                    content: {
                        Text("A").tag(ViewModel.State.Page2.Value2.a)
                        Text("B").tag(ViewModel.State.Page2.Value2.b)
                    }
                )
            }
            .navigationTitle("Page 2")
        }
        .tabItem { Label("Page 2", systemImage: "circle.fill") }
    }
}

// MARK: - ViewModel

extension PreviewTestingDemo {
    final class ViewModel: ObservableObject {
        @Published var state: State

        init(state: State) {
            self.state = state
        }

        struct State {
            var selectedTab: Tab
            var page1: Page1
            var page2: Page2

            struct Page1 {
                var isDetailActive: Bool
            }

            struct Page2 {
                var value1: Bool
                var value2: Value2

                enum Value2 {
                    case a
                    case b
                }

            }

            enum Tab {
                case page1
                case page2
            }
        }
    }
}

// MARK: - Previews
struct PreviewTestingDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            previewPage1Main
            previewPage1Detail
            previewPage2FalseA
            previewPage2TrueB
        }
    }

    static var previewPage1Main: some View {
        PreviewTestingDemo(
            viewModel: .init(
                state: .init(
                    selectedTab: .page1,
                    page1: .init(isDetailActive: false),
                    page2: .init(value1: false, value2: .a)
                )
            )
        )
        .previewDisplayName("Page 1 Main")
    }

    static var previewPage1Detail: some View {
        PreviewTestingDemo(
            viewModel: .init(
                state: .init(
                    selectedTab: .page1,
                    page1: .init(isDetailActive: true),
                    page2: .init(value1: false, value2: .a)
                )
            )
        )
        .previewDisplayName("Page 1 Detail")
    }

    static var previewPage2FalseA: some View {
        PreviewTestingDemo(
            viewModel: .init(
                state: .init(
                    selectedTab: .page2,
                    page1: .init(isDetailActive: true),
                    page2: .init(value1: false, value2: .a)
                )
            )
        )
        .previewDisplayName("Page 1 False A")
    }

    static var previewPage2TrueB: some View {
        PreviewTestingDemo(
            viewModel: .init(
                state: .init(
                    selectedTab: .page2,
                    page1: .init(isDetailActive: true),
                    page2: .init(value1: true, value2: .b)
                )
            )
        )
        .previewDisplayName("Page 1 True B")
    }
}
