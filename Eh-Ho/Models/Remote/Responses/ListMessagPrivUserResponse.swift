//
//  ListMessagPrivUser.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 09/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//


import Foundation

// MARK: - ListMessagPrivUserResponse
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









