//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Dale Musser on 7/19/19.
//  Copyright © 2019 Dale Musser. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var inventoryTableView: UITableView!
    
    let jsonFileName = "inventory"
    
    var inventory: Inventory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inventory = InventoryLoader.load(jsonFileName: jsonFileName)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product_cell", for: indexPath)
        
        if let product = inventory?.products[indexPath.row] {
            cell.textLabel?.text = product.title
            cell.detailTextLabel?.text = "In stock: \(product.stockedQuantity), Price: $\(product.price), ID: \(product.id), Category: \(product.category)"
        }
        
        return cell
    }
}

