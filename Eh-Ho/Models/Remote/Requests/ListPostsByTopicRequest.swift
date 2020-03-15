//
//  ListPostsByTopicRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 14/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ListPostsByTopicRequest: APIRequest {
    
    typealias Response = ListPostsByTopicResponse
    
    let id: Int
    
    init(id:Int) {
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(id)/posts.json"
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
