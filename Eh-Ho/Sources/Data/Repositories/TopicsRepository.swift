//
//  TopicsRepository.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol TopicsRepository {
    func getListTopic(completion: @escaping(Result<ListTopicsResponse, ApiErrorResponse>) -> ())
    
    func getSingleTopicById(id: Int, completion: @escaping(Result<SingleTopicResponse, ApiErrorResponse>) -> ())
    
    func detailUser ( userName: String, password: String, completion: @escaping(Result<UserSignInResponse, ApiErrorResponse>) -> ())
    
    func getMessagePrivUser (userName: String, completion: @escaping(Result<ListMessagPrivUserResponse, ApiErrorResponse>) -> ())
}
