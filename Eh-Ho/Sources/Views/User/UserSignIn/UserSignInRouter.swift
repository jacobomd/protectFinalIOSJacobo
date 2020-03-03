//
//  UserSignInRouter.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignInRouter {
    
    weak var viewcontroller : UserSignInViewController?
    
    static func configureModule () -> UIViewController {
        let router = UserSignInRouter()
        let viewModel = UserSignInViewModel(router: router)
        let viewController = UserSignInViewController(viewModel: viewModel)
        
        viewModel.view = viewController
        router.viewcontroller = viewController
        
        return viewController
    }
}

