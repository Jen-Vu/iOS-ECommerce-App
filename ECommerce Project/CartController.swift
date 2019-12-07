//
//  CartController.swift
//  ECommerce Project
//
//  Created by fall2019 on 11/4/19.
//  Copyright © 2019 Sheriff Olaoye. All rights reserved.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allPrinters = [Printer]()
    var userDefaults = UserDefaults.standard
    var cart = [Int]()
    var shippingCost = 0
    
    @IBOutlet weak var cartTotalLbl: UILabel!
    @IBOutlet weak var shippingCostLbl: UILabel!
    @IBOutlet weak var totalCostLbl: UILabel!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.array(forKey: "cart") != nil{
            cart = userDefaults.array(forKey: "cart")  as? [Int] ?? [Int]()
        } else {
            cart = []
            userDefaults.set(cart, forKey: "cart")
        }
        
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        
        allPrinters.append(Printer(name: "HP Laser", category: "Laser", price: 10.00, latitude: 34, longitude: -98, imageName: "Image", description: text, id: 1))
        allPrinters.append(Printer(name: "HP InkJet", category: "Inkjet", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text, id: 2))
        allPrinters.append(Printer(name: "HP LaserJet", category: "Dot Matrix", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text, id: 3))
        allPrinters.append(Printer(name: "HP Laser", category: "Color", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text, id: 4))
        allPrinters.append(Printer(name: "HP InkJet", category: "Scanner", price: 20.00, latitude: 53.5553, longitude: -113.4905, imageName: "Printer", description: text, id: 5))
        allPrinters.append(Printer(name: "HP LaserJet", category: "All-in-one", price: 30.00, latitude: 30.4652, longitude: 120.4285, imageName: "Printer", description: text, id: 6))
        allPrinters.append(Printer(name: "HP Laser", category: "Fax", price: 10.00, latitude: 34.6073, longitude: -98.4340, imageName: "Printer", description: text, id: 7))
        
        var totalCost = 0.0
        
        for i in cart {
            for printer in allPrinters {
                if printer.id == i {
                    totalCost += printer.price
                    break
                }
            }
        }
        
        if cart.count > 0 {
            shippingCost = 5
        }else{
            shippingCost = 0
        }
        
        cartTotalLbl.text = "$" + String(totalCost)
        shippingCostLbl.text = "$" + String(shippingCost)
        
        let cost = Double(shippingCost) + totalCost
        totalCostLbl.text = "$" + String(cost)
        
        userDefaults.set(cost, forKey: "totalCost")
    }
    
    @IBAction func refreshCart(_ sender: Any) {
        viewDidLoad()
        table.reloadData()
    }
    
    @IBAction func clearCart(_ sender: Any) {
        userDefaults.removeObject(forKey: "cart")
        
        cart = []
        userDefaults.set(cart, forKey: "cart")
        userDefaults.synchronize()
        
        viewDidLoad()
        table.reloadData()
    }
    
    @IBAction func placeOrderBtn(_ sender: Any) {
        if cart.count > 0 {
            var orders = [String]()
            var total: Double?
            
            if userDefaults.string(forKey: "totalCost") != nil {
                let cost = userDefaults.string(forKey: "totalCost")
                totalCostLbl.text = "$" + cost!
                
                total = Double(cost!)
            }
            
            if userDefaults.array(forKey: "cart") != nil{
                cart = userDefaults.array(forKey: "cart")  as? [Int] ?? [Int]()
                let order = String(cart.count) + " item(s): $" + String(total!)
                
                if userDefaults.array(forKey: "orders") != nil {
                    orders = userDefaults.array(forKey: "orders")  as? [String] ?? [String]()
                    orders.append(order)
                    userDefaults.removeObject(forKey: "orders")
                }else{
                    orders.append(order)
                }
                
                userDefaults.removeObject(forKey: "cart")
                cart = []
                userDefaults.set(cart, forKey: "cart")
                
                userDefaults.set(orders, forKey: "orders")
                userDefaults.synchronize()
                
                self.refreshCart(self)
                
                let alert = UIAlertController(title: nil, message: "Order Placed!", preferredStyle: .alert)
                self.present(alert, animated: true)
                let alertTime = 0.4
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertTime){
                    alert.dismiss(animated: true)
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 110
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CustomCartCell
        
        let printerId = cart[indexPath.row]
        
        for printer in allPrinters {
            if printer.id == printerId {
                cell.cartImage.image = #imageLiteral(ResourceName: printer.image)
                cell.nameLabel.text = printer.name
                cell.totalPriceLabel.text = "$" + String(printer.price)
                
                break
            }
        }
       
        return cell
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
