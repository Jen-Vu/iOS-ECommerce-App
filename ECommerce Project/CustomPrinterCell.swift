//
//  CustomPrinterCell.swift
//  ECommerce Project
//
//  Created by fall2019 on 11/6/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class CustomPrinterCell: UITableViewCell {

    
    @IBOutlet weak var printerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
