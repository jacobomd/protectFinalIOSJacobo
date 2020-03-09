//
//  ListMessagPrivUserRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 09/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ListMessagPrivUserRequest: APIRequest {
    
    typealias Response = ListMessagPrivUserResponse
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var method: Method {
           return .GET
       }
       
       var path: String {
           return "/topics/private-messages/\(userName).json"
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
