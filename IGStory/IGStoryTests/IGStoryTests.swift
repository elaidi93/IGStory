//
//  IGStoryTests.swift
//  IGStoryTests
//
//  Created by hamza el aidi on 10/03/2025.
//

import XCTest
@testable import IGStory

final class IGStoryTests: XCTestCase {
    var viewModel: StoryListViewModel!
    var mockPersistenceManager: MockPersistenceManager!

    override func setUp() {
        super.setUp()
        mockPersistenceManager = MockPersistenceManager()
        viewModel = StoryListViewModel()
        viewModel.persistenceManager = mockPersistenceManager

        // Mock users
        viewModel.users = [
            User(id: 1, name: "Neo", profilePictureURL: "https://i.pravatar.cc/300?u=1"),
            User(id: 2, name: "Trinity", profilePictureURL: "https://i.pravatar.cc/300?u=2")
        ]

        // Mock stories
        viewModel.stories = [
            Story(id: 1, userId: 1, imageUrl: "https://via.placeholder.com/300/09f/fff.png", isSeen: false, isLiked: false),
            Story(id: 2, userId: 1, imageUrl: "https://via.placeholder.com/300/09e/fff.png", isSeen: false, isLiked: false),
            Story(id: 3, userId: 2, imageUrl: "https://via.placeholder.com/300/09d/fff.png", isSeen: false, isLiked: false)
        ]
    }

    override func tearDown() {
        viewModel = nil
        mockPersistenceManager = nil
        super.tearDown()
    }

    func testLoadUsers() {
        XCTAssertEqual(viewModel.users.count, 2)
    }

    func testLoadStories() {
        XCTAssertEqual(viewModel.stories.count, 3)
    }

    func testMarkStoryAsSeen() {
        viewModel.loadStories()
        let story = viewModel.stories[0]
        viewModel.markStoryAsSeen(story)
        XCTAssertTrue(viewModel.stories[0].isSeen)
        XCTAssertEqual(mockPersistenceManager.savedStories[0].isSeen, true)
    }

    func testMarkStoryAsUnseen() {
        viewModel.loadStories()
        let story = viewModel.stories[0]
        viewModel.markStoryAsSeen(story)  // Mark as seen first
        viewModel.markStoryAsUnseen(story)
        XCTAssertFalse(viewModel.stories[0].isSeen)
        XCTAssertEqual(mockPersistenceManager.savedStories[0].isSeen, false)
    }

    func testToggleLikeForStory() {
        viewModel.loadStories()
        let story = viewModel.stories[0]
        viewModel.toggleLikeForStory(story)
        XCTAssertTrue(viewModel.stories[0].isLiked)
        XCTAssertEqual(mockPersistenceManager.savedStories[0].isLiked, true)
        
        viewModel.toggleLikeForStory(story)
        XCTAssertFalse(viewModel.stories[0].isLiked)
        XCTAssertEqual(mockPersistenceManager.savedStories[0].isLiked, false)
    }
}
