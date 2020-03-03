//
//  UserSignUpViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignUpViewController: UIViewController {
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Navigations
    @IBAction func butGotoSignIn(_ sender: Any) {
        let vc = UserSignInViewController ()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - UI
    func setupUI() {

    self.title = "Register"
    let backItem = UIBarButtonItem()
    backItem.title = "register"
    let color = UIColor(red: 291/255, green: 99/255, blue: 0/255, alpha: 1.0)
    backItem.tintColor = color
    navigationItem.backBarButtonItem = backItem
        
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 24)!]
        
    }
}
