//
//  PostsViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//
import Foundation

class PostViewModel {
    
    //MARK: - Propierties
    weak var  view: PostsViewControllerProtocol?
    let router: PostRouter
    let id: Int
    let postsRepository: PostsRepository
 
    //MARK: - Inits
    init(router: PostRouter, id: Int, postsRepository: PostsRepository) {
        self.router = router
        self.id = id
        self.postsRepository = postsRepository
    }
    
    //MARK: - Cycle life
    func viewDidLoad() {
        fetchListPostssByTopic()
    }
    
    //MARK: Navigations
    func didTapInTopic(id: Int) {
        router.navigateToPosts(id: id)
    }
    
    //MARK: - Private functions
    private func fetchListPostssByTopic () {
            postsRepository.getListPostssByTopic(id: id) { [weak self] result in
                switch result {
                case .success(let value):
                    self?.view?.showListPostssByTopic(posts: value.postStream.posts)
                case .failure:
                    self?.view?.showError(with: "Error")
                }
            }
    }
}
