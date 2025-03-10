//
//  StoryViewModel.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//

import Foundation
import Combine

class StoryViewModel: ObservableObject {
    @Published var story: Story

    init(story: Story) {
        self.story = story
    }

    func markAsSeen() {
        story.isSeen = true
        saveStoryState()
    }

    func toggleLike() {
        story.isLiked.toggle()
        saveStoryState()
    }

    private func saveStoryState() {
        var stories = PersistenceManager.shared.loadStories()
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index] = story
            PersistenceManager.shared.saveStories(stories)
        }
    }
}
