//
//  PersistenceManager.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//


import Foundation

class PersistenceManager {
    static let shared = PersistenceManager()
    private let defaults = UserDefaults.standard

    private enum Keys {
        static let stories = "stories"
    }

    func saveStories(_ stories: [Story]) {
        do {
            let data = try JSONEncoder().encode(stories)
            defaults.set(data, forKey: Keys.stories)
        } catch {
            print("Failed to save stories: \(error.localizedDescription)")
        }
    }

    func loadStories() -> [Story] {
        if let data = defaults.data(forKey: Keys.stories) {
            do {
                let stories = try JSONDecoder().decode([Story].self, from: data)
                return stories
            } catch {
                print("Failed to load stories: \(error.localizedDescription)")
            }
        }
        return []
    }
}
