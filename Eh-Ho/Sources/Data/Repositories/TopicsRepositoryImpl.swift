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
    
    func getListTopic(completion: @escaping (Result<ListTopicsResponse, Error>) -> ()) {
           let request = ListTopicRequest()
        
        session.send(request: request) { (result) in
            completion(result)
        }
    }
}
