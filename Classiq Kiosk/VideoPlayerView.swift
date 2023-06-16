import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private var player: AVPlayer
    
    init() {
        guard let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4") else {
            fatalError("Video file not found")
        }
        
        player = AVPlayer(url: videoURL)
        player.isMuted = true
        player.play()
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
                .aspectRatio(contentMode: .fit)
            
            // Overlay view to disable video player controls
            Color.clear
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {}
                .onLongPressGesture {}
                .gesture(DragGesture().onEnded { value in
                    if value.translation.width > 100 {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .allowsHitTesting(false)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
