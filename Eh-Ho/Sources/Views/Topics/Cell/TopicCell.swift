//
//  TopicCell.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 01/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    //MARK: - Properties
    var actionBlock: (() -> Void)? = nil
    
    //MARK: - Outlets
    @IBOutlet weak var titleTopicLabel: UILabel!
    @IBOutlet weak var numVisitasLabel: UILabel!
    @IBOutlet weak var numComentsLabel: UILabel!
    @IBOutlet weak var dateTopicLabel: UILabel!
    @IBOutlet weak var buttonAvatar: UIButton!
    
    //MARK: - Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
       buttonAvatar.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
       buttonAvatar.layer.cornerRadius = 30
       buttonAvatar.layer.masksToBounds = true
    }

    //MARK: - Functions
    func configure( title: String, numVisitas: String, numComents: String, dateTopic: String, avatarUserImage: String) {
        titleTopicLabel.text = title
        numVisitasLabel.text = numVisitas
        numComentsLabel.text = numComents
        dateTopicLabel.text = dateTopic
        loadImage(with: avatarUserImage)
    }
    
    //MARK: - Navigations
    @IBAction func butAvatar(_ sender: Any) {
        actionBlock?()
    }
    
    //MARK: - Private functions
    private func loadImage(with imagePath: String) {
        DispatchQueue.global().async { [weak self] in
            if imagePath.isEmpty || !CheckInternet.Connection() {
                DispatchQueue.main.async {
                    self?.buttonAvatar.setImage(UIImage(named: "imagen?"), for: .normal)
                }
            } else {
                let url = URL(string: imagePath)
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self?.buttonAvatar.setImage(UIImage(data: data!), for: .normal)
                }
            }
        }
    }
    
    static func estimateRowHeight() -> CGFloat {
        return 120.0
    }
}
