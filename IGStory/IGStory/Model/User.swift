//
//  User.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//


import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let profilePictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureURL = "profile_picture_url"
    }
}
