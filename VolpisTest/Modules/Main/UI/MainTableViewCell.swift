//
//  MainTableViewCell.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
