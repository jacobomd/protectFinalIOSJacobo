//
//  PostsRouter.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostsRouter {
    
    weak var viewController : PostsViewController?
    
    static func configureModule() -> UIViewController {
        
        let router = PostsRouter()
        let viewModel = PostsViewModel(router: router)
        let viewController = PostsViewController(viewModel: viewModel)
        
        router.viewController = viewController
        viewModel.view = viewController
        
        return viewController
        
    }
    
}
