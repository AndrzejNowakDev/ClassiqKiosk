import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoURL: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: videoURL) else {
            return
        }

        let youtubeRequest = URLRequest(url: youtubeURL)
        uiView.load(youtubeRequest)
    }
}

struct VideoPlayerURLView: View {
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var presentationMode
    let videoURL: String

    var body: some View {
        GeometryReader { geometry in
                    YouTubePlayerView(videoURL: videoURL)
                        .frame(width: geometry.size.width)
                }
                .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, _) in
                        state = value.translation
                    })
                    .onEnded({ (value) in
                        if value.translation.width > 100 {
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
            )
    }
}

struct VideoPlayerURLView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerURLView(videoURL: "https://www.youtube.com/watch?v=EngW7tLk6R8")
    }
}
