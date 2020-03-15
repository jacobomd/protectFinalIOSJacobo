//
//  PostRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 14/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class PostRepositoryImpl: PostsRepository {
    
    let session : SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }
    
    
    func getListPostssByTopic(id: Int, completion: @escaping (Result<ListPostsByTopicResponse, ApiErrorResponse>) -> ()) {
        let request = ListPostsByTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    func createNewPost(id_topic: Int, raw: String, completion: @escaping (Result<AddNewPostResponse, ApiErrorResponse>) -> ()) {
        let request = CreatePostRequest(topic_id: id_topic, raw: raw)
        session.send(request: request) { result in
            completion(result)
        }
    }
}
