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
        
        let router = TopicsRouter()
        let viewModel = TopicsViewModel(router: router)
        let viewController = TopicsViewController(viewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
        
    }
    
}
