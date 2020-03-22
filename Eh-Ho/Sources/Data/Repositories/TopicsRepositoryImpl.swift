//
//  TopicsRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class TopicsRepositoryImpl: TopicsRepository {

    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    func getListTopic(completion: @escaping (Result<ListTopicsResponse, ApiErrorResponse>) -> ()) {
           let request = ListTopicRequest()
        
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
    func getSingleTopicById(id: Int, completion: @escaping (Result<SingleTopicResponse, ApiErrorResponse>) -> ()) {
        let request = SingleTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func detailUser(userName: String, password: String, completion: @escaping (Result<UserSignInResponse, ApiErrorResponse>) -> ()) {
        let request = UserSignInRequest(userName: userName) // Solo necesita el username para hacer el login.
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
    func getMessagePrivUser(userName: String, completion: @escaping (Result<ListMessagPrivUserResponse, ApiErrorResponse>) -> ()) {
        let request = ListMessagPrivUserRequest(userName: userName)
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
    func createNewTopic(title: String, raw: String, completion: @escaping (Result<AddNewTopicResponse, ApiErrorResponse>) -> ()) {
        let request = CreateTopicRequest(title: title, raw: raw)
        session.send(request: request) { (result) in
            completion(result)
        }
    }
    
    func getListPosts(completion: @escaping (Result<ListPostsResponse, ApiErrorResponse>) -> ()) {
        let request = ListPostsRequest()
        session.send(request: request) { (result) in
            completion(result)
        }
    }
}
