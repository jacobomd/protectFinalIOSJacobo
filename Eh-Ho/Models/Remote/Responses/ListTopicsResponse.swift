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
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
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
//    let fancyTitle: String
//    let slug: String
    let postsCount: Int
//    let replyCount: Int
//    let highestPostNumber: Int
//    let imageURL: String?
    let createdAt: String
    let lastPostedAt: String
//    let bumped: Bool?
//    let bumpedAt: String?
//    let unseen, pinned: Bool?
//    let excerpt: String?
//    let visible: Bool
//    let closed: Bool
//    let archived: Bool
    let views: Int
//    let likeCount: Int
//    let hasSummary: Bool
//    let archetype: String
//    let lastPosterUsername: String
//    let categoryID: Int?
//    let pinnedGlobally: Bool?
    let posters: [Poster]

    
    enum CodingKeys: String, CodingKey {
        case id
        case title
//        case fancyTitle = "fancy_title"
//        case slug
        case postsCount = "posts_count"
//        case replyCount = "reply_count"
//        case highestPostNumber = "highest_post_number"
//        case imageURL = "image_url"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
//        case bumped
//        case bumpedAt = "bumped_at"
//        case unseen
//        case pinned
//        case excerpt
//        case visible
//        case closed
//        case archived
        case views
//        case likeCount = "like_count"
//        case hasSummary = "has_summary"
//        case archetype
//        case lastPosterUsername = "last_poster_username"
//        case categoryID = "category_id"
//        case pinnedGlobally = "pinned_globally"
        case posters = "posters"

    }
}

// MARK: - Poster
struct Poster: Codable {
   // let extras: String?
    let description: String
    let userID: Int
   // let primary_group_id: Int?
    
    enum CodingKeys: String, CodingKey {
        //case extras = "extras"
        case description = "description"
        case userID = "user_id"
       // case primary_group_id = "primary_group_id"
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
