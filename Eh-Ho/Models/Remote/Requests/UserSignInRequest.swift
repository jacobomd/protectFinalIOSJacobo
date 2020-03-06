//
//  UserSignInRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 04/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct UserSignInRequest: APIRequest {
    
    typealias Response = UserSignInResponse
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var method: Method {
           return .GET
       }
       
       var path: String {
           return "/users/\(userName).json"
       }
       
       var parameters: [String : String] {
           return [:]
       }
       
       var body: [String : Any] {
           return [:]
       }
       
       var headers: [String : String] {
           return [:]
       }
}

