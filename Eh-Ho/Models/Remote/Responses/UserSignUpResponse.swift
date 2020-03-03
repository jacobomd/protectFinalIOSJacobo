//
//  UserSignUpResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct UserSignUpResponse: Codable {
        let success, active: Bool
        let message: String
        let userID: Int

        enum CodingKeys: String, CodingKey {
            case success, active, message
            case userID = "user_id"
        }
}

