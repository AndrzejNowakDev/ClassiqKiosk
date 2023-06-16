//
//  ContentView.swift
//  Classiq Kiosk
//
//  Created by MAC on 6/16/23.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Int? = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1)
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: VideoPlayerView().navigationBarHidden(true), tag: 1, selection: $selection) {
                EmptyView()
            }

            VStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Button(action: {
                            self.selection = 1
                            print("here-----")
                            
                        }) {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.6)
                                .foregroundColor(.accentColor)
                        }
                        
                        
                        Text("Quantum Computing Software")
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                        
                        HStack {
                            Spacer()
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            Spacer()
                        }
                        .padding(.top, 16)
                        
                        HStack {
                            Spacer()
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            SquareView(size: geometry.size.width * 0.2)
                                .padding(.horizontal, 8)
                            Spacer()
                        }
                        .padding(.top, 16)
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width)
                    .padding()
                }
            }
            .padding()
        }
    }
}

struct SquareView: View {
    let size: CGFloat
    var body: some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(width: size, height: size)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
