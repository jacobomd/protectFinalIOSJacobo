//
//  Topics.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 01/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

//
//  ListTopicsByCategoryResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 20/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.


import Foundation

// MARK: - ListTopicsResponse
struct ListTopicsResponse: Codable {
    let users: [User]
    let topicList: TopicList
    
    enum CodingKeys: String, CodingKey {
        case users
        case topicList = "topic_list"
    }
}

// MARK: - TopicList
struct TopicList: Codable {
    let canCreateTopic: Bool
    let draftKey: String
    let perPage: Int
    let topics: [Topic]
    
    enum CodingKeys: String, CodingKey {
        case canCreateTopic = "can_create_topic"
        case draftKey = "draft_key"
        case perPage = "per_page"
        case topics
    }
}

// MARK: - Topic
struct Topic: Codable {
    let id: Int
    let title: String
    let postsCount: Int
    let createdAt: String
    let lastPostedAt: String
    let views: Int
    let posters: [Poster]
    let avatar_template: String?
    let username: String?

    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case postsCount = "posts_count"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case views
        case posters = "posters"
        case avatar_template
        case username

    }
}

// MARK: - Poster
struct Poster: Codable {
    let description: String
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case userID = "user_id"
    }
}


struct User: Codable {
    let id: Int
    let username: String
    let name: String?
    let avatarTemplate: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
    }
}
