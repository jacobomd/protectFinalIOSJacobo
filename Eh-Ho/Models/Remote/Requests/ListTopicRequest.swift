//
//  ListTopicRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ListTopicRequest: APIRequest {
    
    typealias Response = ListTopicsResponse
    
    var method: Method {
           return .GET
       }
       
       var path: String {
           return "/latest.json"
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
