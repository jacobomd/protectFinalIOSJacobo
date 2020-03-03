//
//  UserSignInViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class UserSignInViewModel {
    weak var view : UserSignInViewController?
    
    let router : UserSignInRouter
    
    init(router: UserSignInRouter) {
        self.router = router
    }
}
