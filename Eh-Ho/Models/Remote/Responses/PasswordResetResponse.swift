//
//  PasswordResetResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 10/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct PasswordResetResponse: Codable {
    //let result: String
    let userFound: Bool

    enum CodingKeys: String, CodingKey {
       // case result
        case userFound = "user_found"
    }
}

 
