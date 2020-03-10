//
//  ListMessagPrivUser.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 09/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//


//import Foundation
//
//// MARK: - Welcome
//struct ListMessagPrivUserResponse: Codable {
//    let topicList: TopicListMessagePrivateUser
//
//    enum CodingKeys: String, CodingKey {
//        case topicList = "topic_list"
//    }
//}
//
//// MARK: - TopicList
//struct TopicListMessagePrivateUser: Codable {
//    let topics: [TopicMessagePrivateUser]
//
//    enum CodingKeys: String, CodingKey {
//        case topics
//    }
//}
//
//// MARK: - Topic
//struct TopicMessagePrivateUser: Codable {
//    let id: Int
//    let title, fancyTitle, slug: String
//    let postsCount, replyCount, highestPostNumber: Int
//    let createdAt, lastPostedAt: String
//
//
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case fancyTitle = "fancy_title"
//        case slug
//        case postsCount = "posts_count"
//        case replyCount = "reply_count"
//        case highestPostNumber = "highest_post_number"
//        case createdAt = "created_at"
//        case lastPostedAt = "last_posted_at"
//    }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ListMessagPrivUserResponse: Codable {
    let topicList: TopicListMessagePrivateUser

    enum CodingKeys: String, CodingKey {
        case topicList = "topic_list"
    }
}

// MARK: - TopicList
struct TopicListMessagePrivateUser: Codable {
    let topics: [TopicMessagePrivateUser]

    enum CodingKeys: String, CodingKey {
        case topics
    }
}

// MARK: - Topic
struct TopicMessagePrivateUser: Codable {
    let title: String

    enum CodingKeys: String, CodingKey {
        case  title
    }
}









