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
    let canCreateTopic: Bool
    let draft: JSONNull?
    let draftKey: String
    let draftSequence, perPage: Int
    let topics: [TopicMessagePrivateUser]

    enum CodingKeys: String, CodingKey {
        case canCreateTopic = "can_create_topic"
        case draft
        case draftKey = "draft_key"
        case draftSequence = "draft_sequence"
        case perPage = "per_page"
        case topics
    }
}

// MARK: - Topic
struct TopicMessagePrivateUser: Codable {
    let id: Int
    let title, fancyTitle, slug: String
    let postsCount, replyCount, highestPostNumber: Int
    let imageURL: CategoryID
    let createdAt, lastPostedAt: String
    let bumped: Bool
    let bumpedAt: String
    let unseen: Bool
    let lastReadPostNumber, unread, newPosts: Int
    let pinned: Bool
    let unpinned: CategoryID
    let visible, closed, archived: Bool
    let notificationLevel: Int
    let bookmarked, liked: Bool
    let views, likeCount: Int
    let hasSummary: Bool
    let archetype, lastPosterUsername: String
    let categoryID: CategoryID
    let pinnedGlobally: Bool
    let posters: [Poster3]
    let participants: [Participant]

    enum CodingKeys: String, CodingKey {
        case id, title
        case fancyTitle = "fancy_title"
        case slug
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case highestPostNumber = "highest_post_number"
        case imageURL = "image_url"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case bumped
        case bumpedAt = "bumped_at"
        case unseen
        case lastReadPostNumber = "last_read_post_number"
        case unread
        case newPosts = "new_posts"
        case pinned, unpinned, visible, closed, archived
        case notificationLevel = "notification_level"
        case bookmarked, liked, views
        case likeCount = "like_count"
        case hasSummary = "has_summary"
        case archetype
        case lastPosterUsername = "last_poster_username"
        case categoryID = "category_id"
        case pinnedGlobally = "pinned_globally"
        case posters, participants
    }
}

// MARK: - CategoryID
struct CategoryID: Codable {
}

// MARK: - Participant
struct Participant: Codable {
    let extras, participantDescription: CategoryID
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case extras
        case participantDescription = "description"
        case userID = "user_id"
    }
}

// MARK: - Poster
struct Poster3: Codable {
    let extras, posterDescription: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case extras
        case posterDescription = "description"
        case userID = "user_id"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}





