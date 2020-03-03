//
//  UserSignInViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignInViewController: UIViewController {
    
    //MARK: - Propierties
    let viewModel : UserSignInViewModel
    
    //MARK: - Inits
    init(viewModel: UserSignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Navigations
    @IBAction func butGotoSignUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UI
    func setupUI() {

    self.title = "Login"
    let backItem = UIBarButtonItem()
    backItem.title = "volver"
    let color = UIColor(red: 291/255, green: 99/255, blue: 0/255, alpha: 1.0)
    backItem.tintColor = color
    navigationItem.backBarButtonItem = backItem
        
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24)!]
        
    }
    
}

//MARK: - Comunication with ViewModel

protocol UserSignInViewControllerProtocol: class {
    
}

extension UserSignInViewController: UserSignInViewControllerProtocol {
    
}
