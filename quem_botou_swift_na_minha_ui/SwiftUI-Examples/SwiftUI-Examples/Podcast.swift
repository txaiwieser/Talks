import Foundation

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
