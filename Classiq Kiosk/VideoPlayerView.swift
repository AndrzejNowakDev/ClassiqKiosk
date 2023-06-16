import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private var player: AVQueuePlayer
    private var playerLooper: AVPlayerLooper?
    
    init() {
        guard let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4") else {
            fatalError("Video file not found")
        }
        
        player = AVQueuePlayer()
        let playerItem = AVPlayerItem(url: videoURL)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        player.play()
        player.isMuted = true
        player.allowsExternalPlayback = false
    }
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
        }
        .gesture(DragGesture().onEnded { value in
            if value.translation.width > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
