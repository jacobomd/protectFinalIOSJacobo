//
//  DeatilUserViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 08/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class DeatilUserViewController: UIViewController {
    
    @IBOutlet weak var imagAvatar: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatusModerator: UILabel!
    @IBOutlet weak var labelLastSeen: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure(labelUsername: String, labelName: String, labelStatusModerator: Bool, labelLastSeen: String) {
        self.labelUserName.text = labelUsername
        self.labelName.text = labelName
        self.labelStatusModerator.text = labelStatusModerator.description
        self.labelLastSeen.text = labelLastSeen
      
    }

}
