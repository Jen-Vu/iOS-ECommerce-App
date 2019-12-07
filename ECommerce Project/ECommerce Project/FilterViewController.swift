//
//  FilterViewController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/30/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class FilterViewController: UITableViewController {
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    func category(row: Int) -> String {
        switch (row) {
        case 0:
            return "Laser"
        case 1:
            return "InkJet"
        case 2:
            return "Dot Matrix"
        case 4:
            return "Color"
        case 5:
            return "Black"
        case 6:
            return "All-in-one"
        default:
            return "All categories"
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        
        cell.textLabel!.text = category(row: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: "seguePrinters", sender: self)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seguePrinters"){
            let printersViewController = segue.destination as! PrintersViewController
            printersViewController.printerCategory = self.category(row: self.index!)
            print(printersViewController.printerCategory!)
        }
    }
}
