//
//  PostsRepository.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 14/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

protocol PostsRepository {
    func getListPostssByTopic(id: Int, completion: @escaping(Result<ListPostsByTopicResponse, ApiErrorResponse>) -> ())
       func createNewPost(id_topic: Int, raw: String, completion: @escaping(Result<AddNewPostResponse, ApiErrorResponse>) -> ())
}
