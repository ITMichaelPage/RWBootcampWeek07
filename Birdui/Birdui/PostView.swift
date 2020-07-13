//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  @Environment(\.colorScheme) var colorScheme
  
  let post: MediaPost
  
  var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMM, HH:mm"
    return dateFormatter
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        // MARK: - Profile image
        Image(uiImage: post.profileImage)
          .resizable()
          .clipShape(Circle())
          .overlay(Circle().stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1))
          .frame(width: 50, height: 50)
        // MARK: - Name and timestamp
        VStack(alignment: .leading) {
          Text(post.userName)
          Text("\(dateFormatter.string(from: post.timestamp))")
        }
      }
      // MARK: - Post text body
      Text(post.textBody ?? "")
      // MARK: - Optional post image
      if post.uiImage != nil {
        HStack {
          Spacer()
          Image(uiImage: post.uiImage!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
          Spacer()
        }
      }
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
        PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
          userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
          uiImage: UIImage(named: "octopus")))
          .previewLayout(.sizeThatFits)
          .environment(\.colorScheme, .light)
      
        PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
          userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
          uiImage: UIImage(named: "octopus")))
          .previewLayout(.sizeThatFits)
          .environment(\.colorScheme, .dark)
          .background(Color.black)
    }
  }
}
