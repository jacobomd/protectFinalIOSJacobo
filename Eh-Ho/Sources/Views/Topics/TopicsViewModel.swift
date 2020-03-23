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
    let postsRepository: PostsRepository
    private let realmDataManager = RealmDataManager()
    
    //MARK: - Inits
    init(router: TopicsRouter, topicRepository: TopicsRepository, postsRepository: PostsRepository) {
        self.router = router
        self.topicRepository = topicRepository
        self.postsRepository = postsRepository
    }
    
    //MARK: - Public functions
    func viewDidLoad () {
        fetchListTopics()
    }
    
    func didTapAvatarUser(userName: String) {
        detailUser(userName: userName)
        listMessagPrivUser(userName: userName)
        //TODO : - FALTA IMPLEMENTACIO NUMERO DE MENSAJES PRIVADOS
    }
    
    //MARK: - Navigations
    func didTapInTopic(id: Int) {
        router.navigateToPosts(id: id)
    }
    
    func didTapInCreateTopic() {
        router.navigateToCreateTopic()
    }
    
    //MARK: - Private functions
    
    private func fetchListTopics () {
        
        if CheckInternet.Connection() {
            topicRepository.getListTopic { [weak self] (result) in
                switch result {
                case .success(let value):
                    // successss
                    self?.view?.showListTopics(topics: value.topicList.topics, users: value.users)
                    self?.realmDataManager.saveTopics(topicDB: value.topicList.topics)
                    let topicList = value.topicList.topics
                    for topic in topicList {
                        self?.fetchListPostssByTopic(id: topic.id)
                    }
                case .failure(let error):
                    // error
                    self?.view?.showError(message: error.errors.joined(separator: ","))
                }
            }
        } else {
            let topicsDB = self.realmDataManager.loadTopics()
            self.view?.shoListTopicDB(topicsDB: topicsDB)
        }
    }
    
    private func fetchListPostssByTopic (id: Int) {
            postsRepository.getListPostssByTopic(id: id) { [weak self] result in
                switch result {
                case .success(let value):
                    self?.realmDataManager.savePosts(postDB: value.postStream.posts)
                case .failure(let error):
                    self?.view?.showError(message: error.errors.joined(separator: ","))
                }
            }
    }
        
    private func fetchSingleTopic(topic : Topic) {
        topicRepository.getSingleTopicById(id: topic.id) { result in
                switch result {
                case .success(let value):
                    //Enviariamos a la vista para mostrar la info
                    self.view?.showListAvatarByTopic(avatar: value.details.createdBy.avatarTemplate)
                case .failure(let error):
                    //Enviaremos a la vista el error
                    self.view?.showError(message: error.localizedDescription)
                }
            }
    }
    
    private func detailUser(userName: String) {
        
        topicRepository.detailUser(userName: userName, password: "password") {
            [weak self] result in
            switch result {
            case .success(let value):
                self?.view?.showDetailUser(detailUser: value.user)
                Session.saveSession(userName: value.user.username)
            case .failure(let error):
                self?.view?.showError(message: error.errors.joined(separator: ","))
            }
        }
        
    }
    
    private func listMessagPrivUser(userName: String) {
        topicRepository.getMessagePrivUser(userName: userName) {
            [weak self] result in
            switch result {
            case .success(let value):
                self?.view?.showListMessagPrivUser(listMessagPriv: value.topicList.topics)
            case .failure(let error):
                self?.view?.showError(message: error.errors.joined(separator: ","))
            }
        }
    }
}
