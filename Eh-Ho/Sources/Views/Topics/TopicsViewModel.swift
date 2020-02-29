//
//  TopicsViewModel.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

class TopicsViewModel {
    
    weak var view : TopicsViewControllerProtocol?
    
    let router : TopicsRouter
    
    init(router: TopicsRouter) {
        self.router = router
    }
    
}
