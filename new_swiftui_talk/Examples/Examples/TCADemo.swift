//
//  TCADemo.swift
//  Examples
//
//  Created by Txai Wieser on 26/08/20.
//

import SwiftUI
import ComposableArchitecture

struct TCADemoState: Equatable {
    var count = 0
}

enum TCADemoAction: Equatable {
    case decrementButtonTapped
    case incrementButtonTapped
}

struct TCADemoEnvironment {}

let tcaDemoReducer = Reducer<TCADemoState, TCADemoAction, TCADemoEnvironment> { state, action, _ in
    switch action {
    case .decrementButtonTapped:
        state.count -= 1
        return .none
    case .incrementButtonTapped:
        state.count += 1
        return .none
    }
}

struct TCADemoView: View {
    let store: Store<TCADemoState, TCADemoAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Button("−") { viewStore.send(.decrementButtonTapped) }
                Text("\(viewStore.count)")
                Button("+") { viewStore.send(.incrementButtonTapped) }
            }
        }
    }
}

struct TCADemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TCADemoView(
                store: Store(
                    initialState: TCADemoState(),
                    reducer: tcaDemoReducer,
                    environment: TCADemoEnvironment()
                )
            )
        }
    }
}
