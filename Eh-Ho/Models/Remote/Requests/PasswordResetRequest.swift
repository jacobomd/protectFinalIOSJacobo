//
//  PasswordResetRequest.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 10/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct PasswordResetRequest: APIRequest {
    
    typealias Response = PasswordResetResponse
    
    let login: String
    
    init(login: String) {
        self.login = login
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/session/forgot_password"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["login": login]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
