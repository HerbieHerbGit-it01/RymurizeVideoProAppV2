import SwiftUI

struct VideoTileView: View {
    let video: Video
    let onVideoSelected: () -> Void
    let onDescriptionTap: () -> Void
    @State private var isTapped = false

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Button(action: {
                isTapped = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isTapped = false
                    onVideoSelected()
                }
            }) {
                ZStack {
                    AsyncImage(url: URL(string: video.thumbnailURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(height: 120)
                    .clipped()

                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                        .scaleEffect(isTapped ? 1.25 : 1.0)
                        .animation(.easeOut(duration: 0.2), value: isTapped)
                }
            }

            Button(action: onDescriptionTap) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(video.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Text(video.description)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(3)
                        .truncationMode(.tail)
                }
                .padding(8)
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
            }
        }
        .padding(.top, 4)
        .padding(.bottom, 8)
        .padding(.horizontal, 4)
        .frame(width: 210)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
