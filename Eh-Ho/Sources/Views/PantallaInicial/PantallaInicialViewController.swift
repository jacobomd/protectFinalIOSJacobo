//
//  PantallaInicialViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 26/02/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class PantallaInicialViewController: UIViewController {
    
    //MARK: - Outets
    @IBOutlet weak var logo_Rectangulo: UIImageView!
    @IBOutlet weak var logo_Triangulo: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var logoConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoWidthConstraint: NSLayoutConstraint!
    
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Splash Screen"
        logoConstraint.constant -= view.bounds.height
        logoHeightConstraint.constant = logo.bounds.height + 300
        logoWidthConstraint.constant = logo.bounds.width + 300
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationsLogo()
    }
    
    //MARK: - Animations
    private func animationsLogo() {
        
        
        UIView.animate(withDuration: 5, delay: 0.0, options: .curveEaseOut,
                       animations: {
                        self.logoHeightConstraint.constant = self.logo.bounds.height - 300
                        self.logoWidthConstraint.constant = self.logo.bounds.width - 300
                        self.logoConstraint.constant = 0.0
                        self.view.layoutIfNeeded()
        }) { (success) in
            
            if success {
                //TODO: - Acceder a un ViewController en concreto.
                print("Ahora debería de ir a una vista que yo decida....")
            }
        }
        
    }

    

}
