//
//  CreateTopicViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class CreateTopicsViewModel  {
    
   //MARK: - Properties
    weak var view: CreateTopicsViewControllerProtocol?
    let router : CreateTopicsRouter
    let topicRepository: TopicsRepository
    
    //MARK: - Inits
    init(router : CreateTopicsRouter, topicRepository: TopicsRepository) {
        self.router = router
        self.topicRepository = topicRepository
    }
    
    //MARK: - Navigations
    func didTapInTopic(title: String, raw: String) {
        createNewPostByTopic(title: title, raw: raw)
        
    }
    
    //MARK: - Private functions
    private func createNewPostByTopic(title: String, raw: String) {
        topicRepository.createNewTopic(title: title, raw: raw) { [weak self] result in
            switch result {
            case .success( _):
                self?.view?.createNewTopic()
                self?.router.navigateToPosts()
            case .failure(let error):
                self?.view?.showError(with: error.errors.joined(separator: ","))
            }
        }
    }
    
}
