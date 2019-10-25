//
//  PrinterDetailsController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/23/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class PrinterDetailsController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    // @IBOutlet weak var mapView: MKMapView!
    
    var printer = Printer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageName = printer.image
        image?.image = #imageLiteral(resourceName: imageName)
        priceLabel?.text = String(printer.price)
        nameLabel?.text = printer.name
        descriptionText?.text = printer.description
 
        // Do any additional setup after loading the view.
    }
    
    /*
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let printer = context as? Printer {
            self.printer = printer
        }
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
