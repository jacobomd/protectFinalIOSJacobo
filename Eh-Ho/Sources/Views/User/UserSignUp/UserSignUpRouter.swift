//
//  UserSignUpRouter.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignUpRouter {
    
    weak var viewController : UserSignUpViewController?
    
    static func configureModule () -> UIViewController {
        
        let router = UserSignUpRouter()
        let sessionApi = SessionAPI()
        let signUpRepository = LoginSignUpRepositoryImpl(session: sessionApi)
        let viewModel = UserSignUpViewModel(router: router, signUpRepository: signUpRepository)
        let viewController = UserSignUpViewController(viewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
        
    }
    
    func navigateToTopicList() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
