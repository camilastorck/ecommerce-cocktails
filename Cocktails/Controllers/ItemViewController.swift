//
//  ItemViewController.swift
//  Cocktails
//
//  Created by Apple on 28/05/2022.
//

import UIKit
import Combine

class ItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    private let vm: ItemsViewModel
    private let cart: CartViewModel
    let item: Item
    
    init(item: Item, viewModel: ItemsViewModel, cart: CartViewModel) {
        self.item = item
        self.vm = viewModel
        self.cart = cart
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.layer.cornerRadius = 20
        addToCartOutlet.layer.cornerRadius = 10
        
        itemImage.image = UIImage(named: item.image)
        itemTitle.text = item.title
        itemDescription.text = item.description
        itemPrice.text = "\(item.price)"
    }

    @IBAction func addToCartButton(_ sender: UIButton) {
        cart.itemsInCart.append(item)
        print(cart.itemsInCart)
        showAlert()
    }
    
    @IBAction func goToHomeController(_ sender: UIButton) {
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Listo!", message: "\(item.title) agregado al carrito.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            
        }))
        present(alert, animated: true)
    }
}
