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
  @State var newPostViewIsVisible: Bool = false
  var body: some View {
    VStack {
      // MARK: - Header
      VStack {
        // MARK: - Birdui icon and centered heading
        ZStack {
          HStack {
            Image("mascot_swift-badge", label: Text("This is a mascot swift badge"))
              .resizable()
              .frame(width: 50, height: 50)
            Spacer()
          }
          Text("Home")
            .font(.title)
        }
        // MARK: - Create new post button
        HStack {
          Button(action: {
            self.newPostViewIsVisible = true
          }) {
            Text("Create New Post")
            .accessibility(addTraits: .isButton)
            .accessibility(hint: Text("This button can create a new post."))
          }
          .sheet(isPresented: $newPostViewIsVisible) {
            NewPostView(postHandler: self.postViewModel)
          }
          Spacer()
        }
      }
      .padding([.leading, .trailing])
      // MARK: - List of posts
      List(postViewModel.posts) { post in
        PostView(post: post)
      }
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
