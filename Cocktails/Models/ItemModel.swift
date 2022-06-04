//
//  ItemModel.swift
//  Cocktails
//
//  Created by Apple  on 29/05/2022.
//

import UIKit

struct Item: Decodable {
    
    let title: String
    let description: String
    let price: Double
    let image: String
    
    static let placeholder = Item(title: "", description: "", price: 0.0, image: "")
    
}
