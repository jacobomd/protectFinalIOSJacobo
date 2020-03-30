//
//  DeatilUserViewController.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 08/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class DeatilUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imagAvatar: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelStatusModerator: UILabel!
    @IBOutlet weak var labelLastSeen: UILabel!
    @IBOutlet weak var labelNumMessagPriv: UILabel!
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        imagAvatar.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
        imagAvatar.layer.cornerRadius = 65
        imagAvatar.layer.masksToBounds = true
    }
    
    //MARK: - Public functions
    func configure(avatar: String, username: String, name: String, statusModerator: String, lastSeen: String, listMessagPriv: String) {
        labelUserName.text = username
        labelName.text = name
        labelStatusModerator.text = statusModerator
        labelLastSeen.text = lastSeen
        labelNumMessagPriv.text = listMessagPriv
        loadImage(with: avatar)
      
    }
    
    //MARK: - Public functions
    private func loadImage(with imagePath: String) {
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: imagePath)
           let data = try? Data(contentsOf: url!)
           DispatchQueue.main.async {
            self?.imagAvatar.image = UIImage(data: data!)

           }
        }
    }

}
