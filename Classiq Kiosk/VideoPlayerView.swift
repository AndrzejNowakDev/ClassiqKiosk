//
//  VideoPlayerView.swift
//  Classiq Kiosk
//
//  Created by MAC on 6/16/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    private var player: AVPlayer
        
    init() {
            guard let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4") else {
                fatalError("Video file not found")
            }
            
            player = AVPlayer(url: videoURL)
            player.play()
        }
        
        var body: some View {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
        }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
