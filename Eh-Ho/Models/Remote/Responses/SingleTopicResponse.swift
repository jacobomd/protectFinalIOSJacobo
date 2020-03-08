//
//  SingleTopicResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 07/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation


// MARK: - SingleTopicResponse

struct SingleTopicResponse: Codable {
    

    
    let id: Int
    let title: String
    let userID: Int
    let details: Details

    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case userID = "user_id"
        case details = "details"
        
    }
    
}


// MARK: - Details

struct Details: Codable {

    let createdBy: CreatedBy
    
    enum CodingKeys: String, CodingKey {

        case createdBy = "created_by"
    }
    
}



// MARK: - CreatedBy

struct CreatedBy: Codable {
    
    let id: Int
    
    let username: String
    
    let name: String
    
    let avatarTemplate: String
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        
        case username = "username"
        
        case name = "name"
        
        case avatarTemplate = "avatar_template"
        
    }
    
}
