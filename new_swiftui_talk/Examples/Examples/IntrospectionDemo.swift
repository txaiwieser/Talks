//
//  IntrospectionDemo.swift
//  Examples
//
//  Created by Txai Wieser on 25/08/20.
//  Copyright © 2020 Txai Wieser. All rights reserved.
//

import SwiftUI
import Introspect

struct IntrospectionDemo: View {
    @State var isModalPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    Text("Row \(index)")
                }
            }
            .navigationBarItems(trailing: openModalButton)
            .navigationBarTitle(Text("My App"))
        }
    }

    var openModalButton: some View {
        Button(
            "Open Modal",
            action: {
                self.isModalPresented = true
            }
        )
        .sheet(
            isPresented: $isModalPresented,
            content: {
                modalContent
            }
        )
    }

    var modalContent: some View {
        Text("Modal")
            .frame(
                minWidth: .zero,
                maxWidth: .infinity,
                minHeight: .zero,
                maxHeight: .infinity
            )
            .background(
                Color.red
                    .ignoresSafeArea()
            )
    }
}

struct IntrospectionDemo_Previews: PreviewProvider {
    static var previews: some View {
        IntrospectionDemo()
    }
}














































/*
struct IntrospectionDemo: View {
    @State var isModalPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    Text("Row \(index)")
                }
            }
            .navigationBarItems(trailing: barButton)
            .navigationBarTitle(Text("My App"))
            .introspectNavigationController { navigationController in
                navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
            }
        }
    }

    var barButton: some View {
        Button(
            "Tap me",
            action: {
                self.isModalPresented = true
            }
        )
        .sheet(
            isPresented: $isModalPresented,
            content: {
                Color.red
                    .introspectViewController {
                        $0.isModalInPresentation = true
                    }
            }
        )
    }
}
*/
