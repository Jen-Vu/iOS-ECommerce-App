//
//  TableViewController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/21/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var printers = [Printer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create array of Printer
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        
        printers.append(Printer(name: "HP Laser", category: "Laser", price: 10.00, coordinatesX: 900.12, coordinatesY: 800.12, imageName: "Printer", description: text))
        printers.append(Printer(name: "HP InkJet", category: "InkJet", price: 20.00, coordinatesX: 900.12, coordinatesY: 800.12, imageName: "Printer", description: text))
        printers.append(Printer(name: "HP LaserJet", category: "LaserJet", price: 30.00, coordinatesX: 900.12, coordinatesY: 800.12, imageName: "Printer", description: text))
        

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
        return printers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrinterCell", for: indexPath)

        // Configure the cell...
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let temp = "Segue to row: " + String(indexPath.row)
        print(temp)
        
        performSegue(withIdentifier: "seguePrinterDetails", sender: self)
    }
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let printerDetailsController = segue.destination as? PrinterDetailsController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
                return
        }
        printerDetailsController.printer = printers[index]
    }
}

