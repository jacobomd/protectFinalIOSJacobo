//
//  UserSignInViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit
import Strongbox

class UserSignInViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    //MARK: - Propierties
    let viewModel : UserSignInViewModel
    var login : String = ""
   
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
        self.navigationController?.pushViewController(UserSignUpRouter.configureModule(), animated: true)
    }
    @IBAction func butSignIn(_ sender: Any) {
        if CheckInternet.Connection() {
        guard let userName = txtUserName.text,
            let password = txtPassword.text else {return}
        viewModel.didTapInSignIn(userName: userName, password: password)
        } else {
            showSignInAlert(message: "You need to have an internet connection to carry out the action")
        }
    }
    
    @IBAction func butPasswReset(_ sender: Any) {
        showPasswResetAlert()
    }
    
    //MARK: - UI
    func setupUI() {
    self.title = "Login"
    let backItem = UIBarButtonItem()
    backItem.title = "login"
    let colorOrange = UIColor.systemOrange
    let colorBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    backItem.tintColor = colorBlack
    navigationItem.backBarButtonItem = backItem
    navigationController?.navigationBar.barTintColor = colorOrange
        
    }
    
    //MARK: - Private functions
    
    private func showSignInAlert(message: String)  {
        //Create the alert
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        //Creamos la accion
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        //Aañadimos a la alerta
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showPasswResetAlert()  {
        //Create the alert
        let alert = UIAlertController(title: "Enter your username or email, and we'll send you a password reset email", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Enter your username or email"
            UITextField.textAlignment = .center
        }
        
        //Creamos la accion
        let action = UIAlertAction(title: "Reset Password", style: .default) { [unowned alert] _ in
            self.login = alert.textFields![0].text!
            self.viewModel.didTapInPasswReset(login: self.login)
        }
        
        //Aañadimos a la alerta
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Comunication  ViewModel
protocol UserSignInViewControllerProtocol: class {
    func showUserLogged(value: String)
    func showPasswReset(valueResult: String)
    func showErrorUserLogged(error: String)
}

extension UserSignInViewController: UserSignInViewControllerProtocol {
    
    func showUserLogged(value: String) {
        showUserLoggedAlert (message: "User successfully logged in with the name of: \(value)")
    }
    
    func showPasswReset(valueResult: String) {
        showUserLoggedAlert(message: "\(valueResult)")
    }
    
    func showErrorUserLogged(error: String) {
        showErrorUserLoggedAlert(message: "Error: \(error)")
    }
    
    private func showUserLoggedAlert (message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.viewModel.navigateToTopics()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showErrorUserLoggedAlert (message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
