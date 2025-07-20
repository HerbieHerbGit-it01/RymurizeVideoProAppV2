import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoURL: URL
    @State private var player: AVPlayer? = nil
    @State private var showQuizModal = false
    @State private var hasFinishedPlaying = false

    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
            }
        }
        .onAppear {
            // Setup audio session
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("❌ Audio session error: \(error)")
            }

            let asset = AVURLAsset(url: videoURL)
            let playerItem = AVPlayerItem(asset: asset)

            // Buffering settings
            playerItem.preferredForwardBufferDuration = 5
            playerItem.canUseNetworkResourcesForLiveStreamingWhilePaused = true

            let newPlayer = AVPlayer(playerItem: playerItem)
            newPlayer.automaticallyWaitsToMinimizeStalling = false
            newPlayer.volume = 1.0
            newPlayer.seek(to: .zero)
            newPlayer.play()

            self.player = newPlayer

            // Clean up old observers
            NotificationCenter.default.removeObserver(self,
                                                      name: .AVPlayerItemDidPlayToEndTime,
                                                      object: playerItem)

            // Listen for video end
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: playerItem,
                queue: .main
            ) { _ in
                print("✅ AVPlayerItemDidPlayToEndTime fired!")
                hasFinishedPlaying = true
                showQuizModal = true
            }
        }
        // 👇 Correctly attached quiz modal with detents
        .sheet(isPresented: $showQuizModal) {
            QuizModalView(
                questions: quizForVideoURL(videoURL),
                onQuizComplete: {
                    showQuizModal = false
                }
            )
            .presentationDetents([.medium, .large])
        }
    }
}
