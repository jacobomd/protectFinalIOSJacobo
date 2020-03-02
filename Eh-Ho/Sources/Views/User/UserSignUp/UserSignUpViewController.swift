//
//  UserSignUpViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 02/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class UserSignUpViewController: UIViewController {

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // dismiss(animated: true, completion: nil)
    }
    
    @IBAction func butGotoSignIn(_ sender: Any) {
        let vc = UserSignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
