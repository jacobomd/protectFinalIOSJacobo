//
//  ListPostsResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 22/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - ListPostsResponse
struct ListPostsResponse: Codable {
    let latestPosts: [LatestPost]

    enum CodingKeys: String, CodingKey {
        case latestPosts = "latest_posts"
    }
}

// MARK: - LatestPost
struct LatestPost: Codable {
    let id: Int
    let username: String
    let avatarTemplate: String
    let createdAt: String
    let cooked: String
    let topicID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatarTemplate = "avatar_template"
        case createdAt = "created_at"
        case cooked
        case topicID = "topic_id"

    }
}

