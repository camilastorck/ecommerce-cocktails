//
//  ItemViewController.swift
//  Cocktails
//
//  Created by Apple  on 28/05/2022.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.layer.cornerRadius = 20
        addToCartOutlet.layer.cornerRadius = 10
    }

    @IBAction func addToCartButton(_ sender: UIButton) {
        
    }
}
