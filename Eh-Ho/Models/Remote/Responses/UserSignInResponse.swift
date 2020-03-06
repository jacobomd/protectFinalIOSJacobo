//
//  UserSignInResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 04/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - UserSignInResponse
struct UserSignInResponse: Codable {
    //let userBadges: [CardBadge]
    let user: LoginUser

    enum CodingKeys: String, CodingKey {
        //case userBadges = "user_badges"
        case user
    }
}

// MARK: - LoginUser
struct LoginUser: Codable {
    let id: Int
    let username, avatarTemplate: String
    let name: String
    let lastPostedAt, lastSeenAt, createdAt: String
    let moderator: Bool
   

    enum CodingKeys: String, CodingKey {
        case id, username
        case avatarTemplate = "avatar_template"
        case name
        case lastPostedAt = "last_posted_at"
        case lastSeenAt = "last_seen_at"
        case createdAt = "created_at"
        case moderator = "moderator"
    }
}


