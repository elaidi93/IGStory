//
//  StoryView.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//

import SwiftUI

struct StoryView: View {
    let user: User
    @ObservedObject var viewModel: StoryListViewModel
    @State private var currentStoryIndex = 0
    
    var body: some View {
        VStack {
            if currentStoryIndex < viewModel.stories.filter({ $0.userId == user.id }).count {
                let story = viewModel.stories.filter({ $0.userId == user.id })[currentStoryIndex]
                VStack {
                    AsyncImage(url: URL(string: story.imageUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } placeholder: {
                        ProgressView()
                    }
                    HStack {
                        Button(action: {
                            showPreviousStory()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                        Button(action: {
                            showNextStory()
                        }) {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                    HStack {
                        Button(action: {
                            viewModel.toggleLikeForStory(story)
                        }) {
                            Image(systemName: story.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding()
                        }
                        Spacer()
                        Button(action: {
                            markStoryAsUnseen(story)
                        }) {
                            Text("Mark as Unseen")
                                .padding()
                        }
                    }
                }
                .onAppear {
                    markStoryAsSeen(story)
                }
            } else {
                Text("No more stories")
            }
        }
        .navigationTitle(user.name)
    }
    
    private func showNextStory() {
        let userStories = viewModel.stories.filter { $0.userId == user.id }
        if currentStoryIndex < userStories.count - 1 {
            currentStoryIndex += 1
        }
    }
    
    private func showPreviousStory() {
        if currentStoryIndex > 0 {
            currentStoryIndex -= 1
        }
    }
    
    private func markStoryAsSeen(_ story: Story) {
        viewModel.markStoryAsSeen(story)
    }
    
    private func markStoryAsUnseen(_ story: Story) {
        viewModel.markStoryAsUnseen(story)
    }
}

#Preview {
    StoryView(
        user: User(
            id: 1,
            name: "Neo",
            profilePictureURL: ""
        ),
        viewModel: StoryListViewModel()
    )
}
