//
//  UserSignUpViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassw: UITextField!
    
    //MARK: - Propierties
    let viewModel : UserSignUpViewModel
    
    //MARK: - Inits
    init(viewModel : UserSignUpViewModel) {
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
    @IBAction func butSignUp(_ sender: Any) {
        guard let email = txtEmail.text,
            let name = txtName.text,
            let userName = txtUserName.text,
            let password = txtPassw.text else {return}
        
        viewModel.didTapInSignUp(email: email, name: name, userName: userName, password: password)
    }
    
    @IBAction func butGotoSignIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UI
    func setupUI() {

    self.title = "Register"
    let backItem = UIBarButtonItem()
    backItem.title = "topics"
    let color = UIColor(red: 291/255, green: 99/255, blue: 0/255, alpha: 1.0)
    backItem.tintColor = color
    navigationItem.backBarButtonItem = backItem
        
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24)!]
        
    }
        
}

//MARK: - Comunications with ViewModel
protocol UserSignUpViewControllerProtocol: class {
    func showUserCreated()
    func showErrorUserCreated(message: String)
}

extension UserSignUpViewController: UserSignUpViewControllerProtocol {
 
    func showUserCreated() {
        showUserCreatedAlert(message: "Registro creado correctamente")
    }
    
    func showErrorUserCreated(message: String) {
         showErrorUserCreatedAlert(message: "Error: \(message)")
     }
    
    private func showUserCreatedAlert (message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.viewModel.navigateToTopics()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showErrorUserCreatedAlert (message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

