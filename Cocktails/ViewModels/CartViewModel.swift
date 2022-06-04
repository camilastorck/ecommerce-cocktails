//
//  CartViewModel.swift
//  Cocktails
//
//  Created by Apple  on 02/06/2022.
//

import Foundation

class CartViewModel {
    
    var itemsInCart: [Item] = []
    
    func finalPriceToPay() -> Double {
        
        let prices = itemsInCart.compactMap { $0.price }
        let result = prices.reduce(0, +)
        return result
    }
    
}
