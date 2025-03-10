//
//  JSONLoader.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//


import Foundation

struct UserPage: Codable {
    let users: [User]
}

struct UserPages: Codable {
    let pages: [UserPage]
}

class JSONLoader {
    static func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("Failed to load JSON: \(error.localizedDescription)")
            }
        }
        return nil
    }
}
