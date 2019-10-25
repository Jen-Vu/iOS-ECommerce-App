//
//  Printer.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/21/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import Foundation
import UIKit

class Printer{
    let category: String
    let price: Double
    let coordinatesX: Float
    let coordinatesY: Float
    let image: String
    let description: String
    let name: String
    
    init(){
        self.category = ""
        self.price = 0.0
        self.coordinatesX = 0.00
        self.coordinatesY = 0.00
        self.image = "Printer"
        self.description = ""
        self.name = ""
    }
    
    init(name: String, category: String, price: Double, coordinatesX: Float, coordinatesY: Float, imageName: String, description: String){
        self.category = category
        self.price = price
        self.coordinatesX = coordinatesX
        self.coordinatesY = coordinatesY
        self.image = imageName
        self.description = description
        self.name = name
    }
}
