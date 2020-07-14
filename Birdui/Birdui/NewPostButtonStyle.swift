//
//  NewPostButtonStyle.swift
//  Birdui
//
//  Created by Michael Page on 13/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct NewPostButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(8)
      .background(
        ZStack {
          Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9660431743, green: 0.7097887993, blue: 0.3707725704, alpha: 1)), Color(#colorLiteral(red: 0.9284794927, green: 0.1866905391, blue: 0.1385837495, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(radius: 6)
        }
    )
      .foregroundColor(.primary)
      .animation(.spring())
      .scaleEffect(configuration.isPressed ? 0.90 : 1)
  }
}

struct NewPostButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Button(action: {
    }) {
      Image(systemName: "square.and.pencil")
        .foregroundColor(.white)
        .font(Font.title.bold())
        .padding()
    }
    .buttonStyle(NewPostButtonStyle())
    .previewLayout(.sizeThatFits)
  }
}
