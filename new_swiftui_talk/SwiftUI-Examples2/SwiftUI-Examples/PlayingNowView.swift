import SwiftUI

struct PlayingNowView: View {
    let podcast: Podcast = podcastsSample[5]

    var body: some View {
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

struct PlayingNowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingNowView()
    }
}
