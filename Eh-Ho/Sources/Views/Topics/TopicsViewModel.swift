//
//  TopicsViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class TopicsViewModel {
    
    //MARK: - Propierties
    weak var view : TopicsViewControllerProtocol?
    let router : TopicsRouter
    let topicRepository: TopicsRepository
    
    //MARK: - Inits
    init(router: TopicsRouter, topicRepository: TopicsRepository) {
        self.router = router
        self.topicRepository = topicRepository
    }
    
    //MARK: - Cycle life
    func viewDidLoad () {
        fetchListTopics()
    }
    
    //MARK: - Private functions
    private func fetchListTopics () {
        
        topicRepository.getListTopic { [weak self] (result) in
            switch result {
            case .success(let value):
                // successss
                self?.view?.showListTopics(topics: value.topicList.topics)
            case .failure(let error):
                // error
                self?.view?.showError(message: error.localizedDescription)
            }
        }
        
    }
    
}
