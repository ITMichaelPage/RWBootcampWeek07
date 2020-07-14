//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  @ObservedObject private var postViewModel = PostViewModel()
  @State private var newPostViewIsVisible: Bool = false
  var body: some View {
    VStack {
      // MARK: - Header
      VStack {
        // MARK: - Birdui icon and centered heading
        ZStack {
          HStack {
            Image("mascot_swift-badge")
              .resizable()
              .frame(width: 50, height: 50)
            Spacer()
          }
          Text("Home")
            .font(.title)
        }
      }
      .padding([.leading, .trailing])
      ZStack {
        // MARK: - List of posts
        List(postViewModel.posts) { post in
          PostView(post: post)
        }
        // MARK: - Create new post button
        VStack {
          Spacer()
          HStack {
            Spacer()
            Button(action: {
              self.newPostViewIsVisible = true
            }) {
              Image(systemName: "square.and.pencil")
                .foregroundColor(.white)
                .font(Font.title.bold())
                .padding()
            }
            .buttonStyle(NewPostButtonStyle())
            .padding()
            .sheet(isPresented: $newPostViewIsVisible) {
              NewPostView(postHandler: self.postViewModel)
            }
          }
        }
      }
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
