//
//  PostCreateViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 15/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PostCreateViewController: UIViewController {

        
    @IBOutlet weak var textfieldRawPost: UITextField!
    let viewModel: PostCreateViewModel
    
    var textoRaw: String = ""
    
    var posts: AddNewPostResponse?
    
    init(viewModel: PostCreateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New post"
        setUI()
    
    }
    
    private func setUI() {
        let backItem = UIBarButtonItem()
        backItem.title = "Volver"
        
        let colorOrange = UIColor.systemOrange
        let colorBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        backItem.tintColor = colorBlack
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.barTintColor = colorOrange
        let createdNewPost = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addNewPost))
        createdNewPost.tintColor = colorBlack
        createdNewPost.image = UIImage(named: "navigation")
        
        // Add button
        navigationItem.rightBarButtonItems = [createdNewPost]
    }
    
    @objc func addNewPost() {
        textoRaw = textfieldRawPost.text ?? ""
        viewModel.didTapInTopic(raw: textoRaw)
    }

}

// MARK: - ViewModel Communication

protocol PostCreateViewControllerProtocol: class {
    func showCreatePostsByTopic(posts: AddNewPostResponse)
    func showError(with message: String)
}

extension PostCreateViewController: PostCreateViewControllerProtocol {
    func showCreatePostsByTopic(posts: AddNewPostResponse) {
        self.posts = posts
        
    }
    
    func showError(with message: String) {
        //AQUI ENSEÑAMOS ALERTA
        print("ERROR")
    }
}
