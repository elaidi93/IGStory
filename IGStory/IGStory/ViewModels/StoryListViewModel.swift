//
//  StoryListViewModel.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var stories: [Story] = []
    private var cancellables: Set<AnyCancellable> = []

    var persistenceManager: PersistenceManager = PersistenceManager.shared

    init() {
        loadUsers()
        loadStories()
    }

    func loadUsers() {
        if let userPages: UserPages = JSONLoader.loadJSON(filename: "users", type: UserPages.self) {
            self.users = userPages.pages.flatMap { $0.users }
        } else {
            print("Failed to load users")
        }
    }

    func loadStories() {
        self.stories = persistenceManager.loadStories()
        
        // If no stories are persisted, create mock data
        if self.stories.isEmpty {
            let storyImages = [
                "https://static.wikia.nocookie.net/onepiece/images/7/7f/Monkey_D._Luffy_Anime_Post_Ellipse_Infobox.png/revision/latest?cb=20170617172443&path-prefix=fr",
                "https://wiki.rpgdbz.com/sites/default/files/styles/table/public/48b6fbe6afbc1b696e02323c8fbb2d55dd15dc8dr1-393-858v2_uhq.jpg",
                "https://printler.com/media/photo/142835.jpg"
            ]

            for user in users {
                for imageUrl in storyImages {
                    let story = Story(id: UUID().hashValue, userId: user.id, imageUrl: imageUrl, isSeen: false, isLiked: false)
                    self.stories.append(story)
                }
            }
            persistenceManager.saveStories(stories)
        }
    }

    func markStoryAsSeen(_ story: Story) {
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index].isSeen = true
            saveStoryStates()
        }
    }

    func markStoryAsUnseen(_ story: Story) {
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index].isSeen = false
            saveStoryStates()
        }
    }

    func toggleLikeForStory(_ story: Story) {
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index].isLiked.toggle()
            saveStoryStates()
        }
    }

    private func saveStoryStates() {
        persistenceManager.saveStories(stories)
    }
}
