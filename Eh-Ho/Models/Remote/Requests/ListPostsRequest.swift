//
//  ListPostsRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 27/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ListPostsRequest: APIRequest {
    
    typealias Response = ListPostsResponse
    
    var method: Method {
           return .GET
       }
       
       var path: String {
           return "/posts.json"
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
