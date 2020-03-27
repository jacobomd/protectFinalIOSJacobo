//
//  TopicsRouter.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class TopicsRouter {
    
    weak var viewController : TopicsViewController?
    
    static func configureModule() -> UIViewController {
        
        let sessionApi = SessionAPI()
        let topicRepository = TopicsRepositoryImpl(session: sessionApi)
    
        let router = TopicsRouter()
        let viewModel = TopicsViewModel(router: router, topicRepository: topicRepository)
        let viewController = TopicsViewController(viewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
        
    }
    
    func navigateToPosts(id: Int) {
        let viewControllerToPush = PostRouter.configureModule(id: id)
        viewControllerToPush.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(viewControllerToPush, animated: true)
    }
    
    func navigateToCreateTopic() {
        let viewControllerToCreateTopic = CreateTopicsRouter.configureModule()
        viewController?.navigationController?.pushViewController(viewControllerToCreateTopic, animated: true)
    }
}
