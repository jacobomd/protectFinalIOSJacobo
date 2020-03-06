//
//  LoginSignUpRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class LoginSignUpRepositoryImpl: LoginSignUpRepository {
    
    let session: SessionAPI

    init(session: SessionAPI) {
        self.session = session
    }
    
    func createUserAccount(email: String, name: String, userName: String, password: String, completion: @escaping (Result<UserSignUpResponse, ApiErrorResponse>) -> ()) {
        
        let request = UserSignUpRequest(email: email, name: name, userName: userName, password: password)
        session.send(request: request) { (result) in
            completion(result)
        }
        
    }
    
    func signInUser(userName: String, password: String, completion: @escaping (Result<UserSignInResponse, ApiErrorResponse>) -> ()) {
        let request = UserSignInRequest(userName: userName) // Solo necesita el username para hacer el login.
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
}
