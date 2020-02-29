//
//  PostsViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class PostsViewModel {
    
    weak var view : PostsViewControllerProtocol?
    
    let router : PostsRouter
    
    init(router: PostsRouter) {
        self.router = router
    }
    
}
