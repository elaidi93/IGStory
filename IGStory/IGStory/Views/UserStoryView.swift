//
//  UserStoryView.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//

import SwiftUI

struct UserStoryView: View {
    let user: User
    let stories: [Story]
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.profilePictureURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(stories.contains(where: { !$0.isSeen }) ? Color.blue : Color.gray, lineWidth: 2)
                    )
                    .grayscale(stories.contains(where: { !$0.isSeen }) ? 0.0 : 1.0)
            } placeholder: {
                ProgressView()
            }
            Text(user.name)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 70)
    }
}

#Preview {
    UserStoryView(
        user: .init(
            id: 2,
            name: "Hamza",
            profilePictureURL: "https://printler.com/media/photo/142835.jpg"
        ),
        stories: [
            .init(
                id: 2,
                userId: 1,
                imageUrl: "https://printler.com/media/photo/142835.jpg",
                isSeen: true,
                isLiked: true
            )
        ]
    )
}
