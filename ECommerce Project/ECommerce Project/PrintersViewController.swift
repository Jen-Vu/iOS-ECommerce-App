//
//  TableViewController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/21/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

struct CellData {
    var printerImage: UIImage
    var name: String
    var price: Double
    var category: String
}

class PrintersViewController: UITableViewController {
    var allPrinters = [Printer]()
    var printerCategories = [Printer]()
    var printerCategory: String?
    var numOfPrinters: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create array of Printer
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        
        allPrinters.append(Printer(name: "HP Laser", category: "Laser", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP InkJet", category: "Inkjet", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP LaserJet", category: "Dot Matrix", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP Laser", category: "Color", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP InkJet", category: "Black", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP LaserJet", category: "All-in-one", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text))
        
        allPrinters.append(Printer(name: "HP Laser", category: "Laser", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP InkJet", category: "Inkjet", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP LaserJet", category: "Dot Matrix", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP Laser", category: "Color", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP InkJet", category: "Black", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text))
        allPrinters.append(Printer(name: "HP LaserJet", category: "All-in-one", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text))
        
        if printerCategory != nil {
            for printer in allPrinters {
                if printer.category == printerCategory {
                    printerCategories.append(printer)
                }
            }
        }
        
        if printerCategories.count == 0 {
            printerCategories = allPrinters
        }
        
        self.numOfPrinters = printerCategories.count
        
        self.tableView.register(CustomTableCell.self, forCellReuseIdentifier: "CustomPrinterCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows of printer
        return self.numOfPrinters
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomPrinterCell") as! CustomTableCell
    
        cell.printerImage = #imageLiteral(resourceName: printerCategories[indexPath.row].image)
        cell.nameLabel.text = printerCategories[indexPath.row].name
        cell.price = printerCategories[indexPath.row].price
        cell.category = printerCategories[indexPath.row].category
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seguePrinterDetails", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seguePrinterDetails"){
            let printerDetailsController = segue.destination as! PrinterDetailsController
            let index = tableView.indexPathForSelectedRow?.row
            printerDetailsController.printer = printerCategories[index!]
        }
    }
}

