//
//  PodcastsDemo.swift
//  Examples
//
//  Created by Txai Wieser on 26/08/20.
//

import SwiftUI

struct PodcastsDemo: View {
    @State private var podcasts: [Podcast] = podcastsSample
    @State private var podcast: Podcast = podcastsSample[0]
    @State private var isCoverflow: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                if isCoverflow {
                    coverflow
                } else {
                    list
                }

                detailView.modifier(PanelModifier())
            }
            .navigationTitle("My Podcasts")

            .navigationBarItems(
                trailing: Button(
                    action: { self.isCoverflow.toggle() },
                    label: { Text("Coverflow") }
                )
            )

            .navigationBarItems(
                trailing: Button(
                    action: { self.isCoverflow.toggle() }
                    label: { Text("Coverflow") }
                )
            )
        }
    }

    var list: some View {
        List {
            ForEach(podcasts) { podcast in
                HStack {
                    Image(podcast.image)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .cornerRadius(10)
                    Text(podcast.name)

                    Spacer()

                    Image(systemName: podcast.isFavorite ? "star.fill" : "star")
                }
            }
            .onDelete { indexSet in
                podcasts.remove(atOffsets: indexSet)
            }
        }
    }

    var coverflow: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(podcasts) { podcast in                          HStack {
                    GeometryReader { geometry in
                        Image(podcast.image)
                            .resizable()
                            .cornerRadius(10)
                            .rotation3DEffect(.degrees(-Double(geometry.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(width: 250, height: 250)
                }
            }
        }
    }

    var detailView: some View {
        VStack {
            HStack {
                Image(podcast.image)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)

                Text(podcast.name)

                Spacer()

                Image(systemName: "backward.fill")
                    .padding()
                Image(systemName: "playpause.fill")
                    .padding()
                Image(systemName: "forward.fill")
                    .padding()
            }
            .padding()

            Text(podcast.description)
                .frame(width: 300)
                .padding()
                .padding(.vertical)
                .background(Color.white)
                .cornerRadius(4)

            Spacer()
        }
        .background(Color(.secondarySystemBackground))
    }

}

struct PodcastsDemo_Previews: PreviewProvider {
    static var previews: some View {
        PodcastsDemo()
    }
}



// MARK: - Podcast

struct Podcast {
    var name: String
    var image: String
    var description: String
    var isFavorite: Bool
}

let podcastsSample: [Podcast] = [
    .init(
        name: "Under the Radar",
        image: "under",
        description: "From development and design to marketing and support, Under the Radar is all about independent app development. It’s never longer than 30 minutes. Hosted by Marco Arment and David Smith.",
        isFavorite: true
    ),
    .init(
        name: "TED Talks Daily",
        image: "ted",
        description: "Ideas worth spreading from the TED Conference",
        isFavorite: false
    ),
    .init(
        name: "Swift Unwrapped",
        image: "unwrapped",
        description: "An audio spin off of Swift Weekly Brief and discussions on the Swift programming language.",
        isFavorite: false
    ),
    .init(
        name: "The Swift Community Podcast",
        image: "community",
        description: "A podcast for the Swift Community, by the Swift Community",
        isFavorite: false
    ),
    .init(
        name: "Ladybug Podcast",
        image: "lady",
        description: "Three ladies debugging the tech industry",
        isFavorite: false
    ),
    .init(
        name: "Philosophize This!",
        image: "philosophize",
        description: "A Free Podcast Dedicated To Sharing The Ideas That Shaped Our World!",
        isFavorite: true
    ),
    .init(
        name: "Accidental Tech Podcast",
        image: "atp",
        description: "Three nerds discussing tech, Apple, programming, and loosely related matters.",
        isFavorite: true
    ),
    .init(
        name: "Swift over Coffee",
        image: "over",
        description: "Swift over Coffee is a podcast that helps you keep your Swift skills up to date the easy way, hosted by Paul Hudson and Erica Sadun. Each episode has news, our picks of the week, plus an open ballot where you can share your views on important topics. Follow us on Twitter at @swiftovercoffee. Note: all the discussion from Erica and Paul is licensed under CC BY-SA 3.0. Our regular intro/outro music is also licensed under CC BY-SA 3.0, and is called “Dropping out of School” by Brad Sucks.",
        isFavorite: false
    )
]

extension Podcast: Equatable, Hashable, Identifiable {
    var id: Int { hashValue }
}






// MARK: - Panel

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









/*
struct PodcastsDemo: View {
    @State private var podcasts: [Podcast] = podcastsSample
    @State private var podcast: Podcast = podcastsSample[0]
    @State private var coverflowActive: Bool = true

    var body: some View {
        ZStack {
            mainView
            detailView.modifier(PanelModifier())
        }
    }

    var mainView: some View {
        NavigationView {
            Group {
                if coverflowActive {
                    coverflow
                } else {
                    list
                }
            }
            .navigationBarTitle("My Podcasts")
            .navigationBarItems(
                trailing: Button(
                    action: { self.coverflowActive.toggle() },
                    label: { Text("Coverflow") }
                )
            )
        }
    }

    var list: some View {
        List {
            ForEach(podcasts) { podcast in
                HStack {
                    Image(podcast.image)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .cornerRadius(10)
                    Text(podcast.name)

                    Spacer()

                    Image(systemName: podcast.isFavorite ? "star.fill" : "star")
                }
            }
            .onDelete {
                self.podcasts.remove(atOffsets: $0)
            }
        }
    }

    var coverflow: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(podcasts) { podcast in
                    HStack {
                        GeometryReader { geometry in
                            Image(podcast.image)
                                .resizable()
                                .cornerRadius(10)
                                .rotation3DEffect(.degrees(-Double(geometry.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    .frame(width: 250, height: 250)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }

    var detailView: some View {
        VStack {
            HStack {
                Image(podcast.image)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)

                Text(podcast.name)

                Spacer()

                Image(systemName: "backward.fill")
                    .padding()
                Image(systemName: "playpause.fill")
                    .padding()
                Image(systemName: "forward.fill")
                    .padding()
            }
            .padding()

            Text(podcast.description)
                .frame(width: 300)
                .padding()
                .padding(.vertical)
                .background(Color.white)
                .cornerRadius(4)

            Spacer()
        }
        .background(Color(.secondarySystemBackground))
    }
}
*/
