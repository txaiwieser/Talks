import SwiftUI

struct MainView: View {
    @State private var podcasts: [Podcast] = podcastsSample
    @State private var coverflowActive: Bool = true

    var body: some View {
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
}

struct ContentView: View {
    var body: some View {
        ZStack {
            MainView()
            PlayingNowView().panel()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
