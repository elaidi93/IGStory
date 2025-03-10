//
//  MockPersistenceManager.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//


import Foundation
@testable import IGStory

class MockPersistenceManager: PersistenceManager {
    var savedStories: [Story] = []
    var loadedStories: [Story] = []

    override func saveStories(_ stories: [Story]) {
        savedStories = stories
    }

    override func loadStories() -> [Story] {
        return loadedStories
    }
}
