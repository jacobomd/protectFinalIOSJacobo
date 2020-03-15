//
//  CreateTopicRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct CreateTopicRequest: APIRequest {
    
    typealias Response = AddNewTopicResponse
    
    let title: String
    let raw: String

    init(title: String,
         raw: String) {
        self.title = title
        self.raw = raw
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/posts.json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["title": title,
                "raw": raw]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
