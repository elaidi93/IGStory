//
//  Story.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//


import Foundation

struct Story: Identifiable, Codable {
    let id: Int
    let userId: Int
    let imageUrl: String
    var isSeen: Bool
    var isLiked: Bool
}