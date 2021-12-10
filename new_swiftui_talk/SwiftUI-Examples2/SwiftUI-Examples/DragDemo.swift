//
//  DragDemo.swift
//  SwiftUI-Examples
//
//  Created by Txai Wieser on 25/08/20.
//  Copyright © 2020 Txai Wieser. All rights reserved.
//

import SwiftUI

//struct Draggable: ViewModifier {
//    @State var position: CGPoint = .zero
//
//    func body(content: Content) -> some View {
//        content
//            .position(position)
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        position = value.location
//                    }
//            )
//    }
//}

struct Draggable: ViewModifier {
    @Binding var position: CGPoint

    func body(content: Content) -> some View {
        content
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.location
                    }
            )
    }
}

struct DragDemoState {
    var element1: Element = .init()
    var element2: Element = .init()


    var element1RelativePosition: CGPoint {
        let margin = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let rect1 = CGRect(
            center: element1.position,
            size: element1.size
        )
        .inset(by: margin)

        let rect2 = CGRect(
            center: element2.position,
            size: element2.size
        )
        .inset(by: margin)

        let intersectionRect = rect1.intersection(rect2)

        var finalPosition = element1.position

        if !intersectionRect.isNull {
            let verticalDiff = intersectionRect.size.height/2
            let horizontalDiff = intersectionRect.size.width/2

            if verticalDiff <= horizontalDiff {
                if rect1.origin.y >= rect2.origin.y {
                    finalPosition.y += verticalDiff
                } else {
                    finalPosition.y -= verticalDiff
                }
            } else {
                if rect1.origin.x >= rect2.origin.x {
                    finalPosition.y -= horizontalDiff
                } else {
                    finalPosition.y += horizontalDiff
                }
            }
        }

        return finalPosition
    }

    var element2RelativePosition: CGPoint {
        let margin = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let rect1 = CGRect(
            center: element1.position,
            size: element1.size
        )
        .inset(by: margin)

        let rect2 = CGRect(
            center: element2.position,
            size: element2.size
        )
        .inset(by: margin)

        let intersectionRect = rect1.intersection(rect2)

        var finalPosition = element2.position

        if !intersectionRect.isNull {
            let verticalDiff = intersectionRect.size.height/2
            let horizontalDiff = intersectionRect.size.width/2

            if verticalDiff <= horizontalDiff {
                if rect1.origin.y >= rect2.origin.y {
                    finalPosition.y += verticalDiff
                } else {
                    finalPosition.y -= verticalDiff
                }
            } else {
                if rect1.origin.x >= rect2.origin.x {
                    finalPosition.y -= horizontalDiff
                } else {
                    finalPosition.y += horizontalDiff
                }
            }
        }

        return finalPosition
    }

    struct Element {
        var position: CGPoint = .zero
        var size: CGSize = .init(width: 160, height:88)
    }
}

struct DragDemo: View {
    @State var state: DragDemoState = .init()

    var body: some View {
        ZStack {
            Text("Hello, World!")
                .padding()
                .frame(width: state.element1.size.width, height: state.element1.size.height)
                .background(Color.red)
                .modifier(Draggable(position: $state.element1.position))

            Text("Hello, World!")
                .padding()
                .frame(width: state.element2.size.width, height: state.element2.size.height)
                .background(Color.green)
                .modifier(Draggable(position: $state.element2.position))
        }
//        .frame(
//            minWidth: .zero, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct DragDemo_Previews: PreviewProvider {
    static var previews: some View {
        DragDemo()
    }
}

extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self = CGRect(
            origin: CGPoint(
                x: center.x - size.width/2,
                y: center.y - size.height/2
            ),
            size: size
        )
    }
}
