//
//  RestaurantTableViewCell.swift
//  Lesson 6 Food Pin (Chapter 9)
//
//  Created by Petrochenko.O on 26.03.2020.
//  Copyright © 2020 Petrochenko.O. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    /*@IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 16 } //thumbnailImageView.bounds.width / 2
    //thumbnailImageView.clipsToBounds = true }
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
