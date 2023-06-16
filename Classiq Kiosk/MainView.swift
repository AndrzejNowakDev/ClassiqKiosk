//
//  ContentView.swift
//  Classiq Kiosk
//
//  Created by MAC on 6/16/23.
//

import SwiftUI

struct MainView: View {
    @State private var showVideoPlayerView = false
    @State private var showVideoPlayerURLView = false
    let videoURL = "https://www.youtube.com/watch?v=EngW7tLk6R8"

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.1)
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            showVideoPlayerView = true
                        }) {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.6)
                                .foregroundColor(.accentColor)
                            NavigationLink("", destination: VideoPlayerView().navigationBarHidden(true), isActive: $showVideoPlayerView)
                        }
                        
                        Text("Quantum Computing Software")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        
                        VStack(spacing: 16) {
                            HStack(spacing: 8) {
                                Spacer()
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Spacer()
                            }
                            
                            HStack(spacing: 8) {
                                Spacer()
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Button(action: {
                                    showVideoPlayerURLView = true
                                }) {
                                    SquareView(size: geometry.size.width * 0.2)
                                    NavigationLink("", destination: VideoPlayerURLView(videoURL: self.videoURL).navigationBarHidden(true), isActive: $showVideoPlayerURLView)
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 16)
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
    }
}

struct SquareView: View {
    let size: CGFloat
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .frame(width: size, height: size)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
