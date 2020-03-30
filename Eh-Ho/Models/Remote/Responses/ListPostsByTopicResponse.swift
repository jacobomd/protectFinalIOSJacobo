//
//  ListPostsByTopicResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 14/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - ListPostsByTopicResponse
struct ListPostsByTopicResponse: Codable {
    let postStream: PostStream2
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case postStream = "post_stream"
        case id
    }
}

// MARK: - PostStream
struct PostStream2: Codable {
    let posts: [Post2]
}

// MARK: - Post
struct Post2: Codable {
    let id: Int
    let username: String
    let createdAt: String
    let cooked: String
    let topicID: Int

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case createdAt = "created_at"
        case cooked
        case topicID = "topic_id"

    }
}
