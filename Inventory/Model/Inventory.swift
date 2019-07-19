//
//  Inventory.swift
//  Inventory
//
//  Created by Dale Musser on 7/19/19.
//  Copyright © 2019 Dale Musser. All rights reserved.
//

import Foundation

struct Inventory: Codable {
    var status: String
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case status
        case products
    }
}

struct Product: Codable {
    var id: Int
    var category: String
    var title: String
    var price: Float
    var stockedQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case price
        case stockedQuantity
    }
}

class InventoryLoader {
    
    class func load(jsonFileName: String) -> Inventory? {
        var inventory: Inventory?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            inventory = try? jsonDecoder.decode(Inventory.self, from: jsonData)
        }
        
        return inventory
    }
}
