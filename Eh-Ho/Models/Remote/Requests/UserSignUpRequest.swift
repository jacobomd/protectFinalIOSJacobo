//
//  UserSignUpRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct UserSignUpRequest: APIRequest {
    
    typealias Response = UserSignUpResponse
    
    let email: String
    let name: String
    let userName: String
    let password: String

    init(email: String, name: String, userName: String, password: String) {
        self.email = email
        self.name = name
        self.userName = userName
        self.password = password
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/users"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["name": name,
                "email": email,
                "password": password,
                "username": userName,
                "active": true,
                "approved": true
                ]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
