//
//  UserSignInViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func butGotoSignUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
