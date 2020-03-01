//
//  TopicCell.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 01/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    //MARK: - Outlets
       @IBOutlet weak var titleTopicLabel: UILabel!
       @IBOutlet weak var numVisitasLabel: UILabel!
       @IBOutlet weak var editTopicButton: UIButton!
       @IBOutlet weak var numComentsLabel: UILabel!
       @IBOutlet weak var dateTopicLabel: UILabel!
       @IBOutlet weak var avatarUserImage: UIImageView!

    //MARK: - Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: - Functions
    func configure( title: String, numVisitas: String, numComents: String, dateTopic: String) {
        titleTopicLabel.text = title
        numVisitasLabel.text = numVisitas
        numComentsLabel.text = numComents
        dateTopicLabel.text = dateTopic
    }
    
}
