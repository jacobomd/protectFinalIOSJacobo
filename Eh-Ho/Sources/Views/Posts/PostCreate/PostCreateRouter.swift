//
//  PostCreateRouter.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostCreateRouter {
    
    weak var viewController: UIViewController?
    
    static func configureModule(id: Int) -> UIViewController {
        
        let router = PostCreateRouter()
        let sessionApi = SessionAPI()
        let postsRepository = PostRepositoryImpl(session: sessionApi)
        let viewModel = PostCreateViewModel(router: router, id: id, postsRepository: postsRepository)
        let viewController = PostCreateViewController(viewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToPosts() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
}
