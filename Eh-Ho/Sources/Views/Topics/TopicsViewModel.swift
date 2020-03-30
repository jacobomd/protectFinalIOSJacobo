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
    private let realmDataManager = RealmDataManager()
    
    //MARK: - Inits
    init(router: TopicsRouter, topicRepository: TopicsRepository) {
        self.router = router
        self.topicRepository = topicRepository
    }
    
    //MARK: - Public functions
    func viewDidLoad () {
        fetchListTopics()
        fetchListPosts()
    }
    
    func didTapAvatarUser(userName: String) {
        detailUser(userName: userName)
        //listMessagPrivUser(userName: userName)
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
                    var image = ""
                    var username = ""
                    let topics: Array<Topic> = value.topicList.topics.compactMap { topic  in
                        for poster in topic.posters {
                            if poster.description.starts(with: "Original Poster") {
                                let userPoster = poster.userID
                                for user in value.users {
                                    if userPoster == user.id {
                                        let avatar_template = user.avatarTemplate
                                        let avatarFinal = avatar_template.replacingOccurrences(of: "{size}", with: "64")
                                        image = "https://mdiscourse.keepcoding.io/\(avatarFinal)"
                                        username = user.username
                                    }
                                }
                            }
                        }

                        let id = topic.id
                        let title = topic.title
                        let visits = topic.views
                        let postsCount = topic.postsCount
                        let lastPostedAt = topic.lastPostedAt
                        let createdAt = topic.createdAt
                        let posters = topic.posters
                        
                        return Topic(id: id, title: title, postsCount: postsCount, createdAt: createdAt, lastPostedAt: lastPostedAt, views: visits, posters: posters, avatar_template: image, username: username)
                    }
                    
                    self?.view?.showListTopics(topics: topics)
                    self?.realmDataManager.saveTopics(topicDB: value.topicList.topics)
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
    
    private func fetchListPosts() {
        topicRepository.getListPosts { [weak self] (result) in
            switch result {
            case .success(let value):
                // success
                self?.realmDataManager.savePosts(postDB: value.latestPosts)
            case.failure(let error):
                // error
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
