//
//  LoginSignUpRepository.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol LoginSignUpRepository {
    
    func createUserAccount (email: String, name: String, userName: String, password: String,
                            completion: @escaping(Result<UserSignUpResponse, ApiErrorResponse>) -> ())
    
    func signInUser ( userName: String, password: String, completion: @escaping(Result<UserSignInResponse, ApiErrorResponse>) -> ())
    
    func passwordReset (login: String, completion: @escaping(Result<PasswordResetResponse,
        ApiErrorResponse>) -> ())
    
}
