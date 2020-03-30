//
//  PostCreateViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class PostCreateViewModel {
    
   //MARK: - Properties
    weak var  view: PostCreateViewControllerProtocol?
    let router: PostCreateRouter
    let id: Int
    let postsRepository: PostsRepository
    
    //MARK: - Inits
    init(router: PostCreateRouter, id: Int, postsRepository: PostsRepository) {
        self.router = router
        self.id = id
        self.postsRepository = postsRepository

    }
    
    //MARK: - Public functions
    func didTapInTopic(raw: String) {
        createNewPostByTopic(raw: raw)
        
    }
    
    //MARK: - Private functions
    private func createNewPostByTopic(raw: String) {
        postsRepository.createNewPost(id_topic: self.id, raw: raw) { [weak self] result in
            switch result {
            case .success( _):
                self?.router.navigateToPosts()
                // no enviamos nada a mostrar a la vista
            case .failure(let error):
                self?.view?.showError(with: error.errors.joined(separator: ","))
            }
        }
    }
    
    
}
