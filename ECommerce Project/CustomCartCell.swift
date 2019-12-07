//
//  CustomCartCell.swift
//  ECommerce Project
//
//  Created by fall2019 on 11/4/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class CustomCartCell: UITableViewCell {

    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
