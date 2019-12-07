//
//  CustomTableCell.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/28/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell{
    var printerImage: UIImage?
    var name: String?
    var price: Double?
    var category: String?
    
    var printerImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var nameView = UILabel()
        nameView.translatesAutoresizingMaskIntoConstraints = false
        return nameView
    }()
    
    var categoryLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var priceLabel: UILabel = {
        var priceView = UILabel()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        return priceView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(printerImageView)
        self.addSubview(nameLabel)
        self.addSubview(categoryLabel)
        self.addSubview(priceLabel)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        printerImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        printerImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        printerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        printerImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        // nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.printerImageView.rightAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        //categoryLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: self.nameLabel.topAnchor).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: self.printerImageView.rightAnchor).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: self.printerImageView.rightAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let pImage = printerImage {
            printerImageView.image = pImage
        }
        
        if let tempName = name {
            nameLabel.text = tempName
        }
        
        if let tempCategory = category {
            categoryLabel.text = "Category: " + tempCategory
        }
        
        if let tempPrice = price {
            priceLabel.text = "$" + String(tempPrice)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
