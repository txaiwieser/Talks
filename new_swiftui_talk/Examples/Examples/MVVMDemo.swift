//
//  TCADemo.swift
//  Examples
//
//  Created by Txai Wieser on 26/08/20.
//

import SwiftUI
import ComposableArchitecture
import Combine

final class MVVMDemoViewModel: ObservableObject {
    @Published private(set) var count = 0

    func decrementButtonTapped() {
        count -= 1
    }

    func incrementButtonTapped() {
        count += 1
    }
}

final class MVVMDemoService {
    func saveData(count: Int) -> AnyPublisher<Int, Error> {
        Just(count)
            .delay(for: 1, scheduler: RunLoop.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct MVVMDemoView: View {
    @StateObject var viewModel: MVVMDemoViewModel

    var body: some View {
        HStack {
            Button("−") { viewModel.decrementButtonTapped() }
            Text("\(viewModel.count)")
            Button("+") { viewModel.incrementButtonTapped() }
        }
    }
}

struct MVVMDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MVVMDemoView(
                viewModel: MVVMDemoViewModel()
            )
        }
    }
}
