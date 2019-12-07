//
//  OrdersController.swift
//  ECommerce Project
//
//  Created by fall2019 on 11/6/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class OrdersController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var userDefaults = UserDefaults.standard
    var orders = [String]()
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if userDefaults.array(forKey: "orders") != nil{
            orders = userDefaults.array(forKey: "orders")  as? [String] ?? [String]()
            
        }else {
            orders = []
        }
        
    }
    
    
    @IBAction func clearOrdersBtn(_ sender: Any) {
        userDefaults.removeObject(forKey: "orders")
        
        orders = []
        userDefaults.set(orders, forKey: "orders")
        userDefaults.synchronize()
        
        viewDidLoad()
        table.reloadData()
    }
    
    
    @IBAction func refreshOrdersBtn(_ sender: Any) {
        viewDidLoad()
        table.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! CustomOrderCell
        
        cell.orderLbl.text = orders[indexPath.row]
        
        return cell
    }
 
}
