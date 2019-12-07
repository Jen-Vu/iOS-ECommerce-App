//
//  PrinterDetailsController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/23/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit
import MapKit

class PrinterDetailsController: UIViewController {
    var cart = [Int]()
    var printer: Printer?
    var userDefaults = UserDefaults.standard
    
    @IBOutlet weak var printerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    // @IBOutlet weak var quantityField: UITextField!
    
    @IBAction func addToCrtButton(_ sender: Any) {
        if userDefaults.array(forKey: "cart") == nil{
            cart.append(printer!.id)
            userDefaults.set(cart, forKey: "cart")
        }else{
            cart = userDefaults.array(forKey: "cart")  as? [Int] ?? [Int]()
            cart.append(printer!.id)
            userDefaults.removeObject(forKey: "cart")
            userDefaults.set(cart, forKey: "cart")
        }

        userDefaults.synchronize()
        
        let alert = UIAlertController(title: nil, message: "Item added to cart!", preferredStyle: .alert)
        self.present(alert, animated: true)
        let alertTime = 0.4
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertTime){
            alert.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let imageName = printer.image
        printerImageView.image = #imageLiteral(resourceName: printer!.image)
        nameLabel.text = printer!.name
        categoryLabel.text = printer!.category
        descriptionTextView.text = printer!.description
        priceLabel.text = "$" + String(printer!.price)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueShowMap"){
            let mapController = segue.destination as! MapController
            mapController.longitude = printer?.longitude
            mapController.latitude = printer?.latitude
        }
    }
}
