//
//  PostsViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 29/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    let viewModel : PostsViewModel
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

// Comunicacion con ViewModel

protocol PostsViewControllerProtocol : class {
    
}

extension PostsViewController : PostsViewControllerProtocol {
    
}
