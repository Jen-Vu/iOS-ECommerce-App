//
//  FilterViewController.swift
//  ECommerce Project
//
//  Created by fall2019 on 10/21/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit


class FilterViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell")!
        
        cell.textLabel!.text = category(value: indexPath.row)
        
        return cell
    }
    
    func category(value: Int) -> String {
        switch (value) {
            case 0:
                return "Laser"
            case 1:
                return "Ink Jet"
            case 2:
                return "Dot Matrix"
            case 4:
                return "All categories"
            default:
                return "None"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if (cell.accessoryType == .checkmark) {
            // Remove option
            cell.accessoryType = .none
        } else {
            // Add option
            cell.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
