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

    var printer: Printer?
    
    @IBOutlet weak var printerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let imageName = printer.image
        printerImageView.image = #imageLiteral(resourceName: printer!.image)
        nameLabel.text = printer!.name
        categoryLabel.text = "Category: " + printer!.category
        descriptionTextView.text = printer!.description
        priceLabel.text = "$" + String(printer!.price)
        
        let center = CLLocationCoordinate2D(latitude: printer!.latitude, longitude: printer!.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
    
}
