//
//  CartViewController.swift
//  Cocktails
//
//  Created by Apple on 02/06/2022.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet var totalPriceLabel: UILabel!
    
    let cart: CartViewModel
    
    init(cart: CartViewModel) {
        self.cart = cart
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cart.itemsInCart)
        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: CartTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        checkoutButton.layer.cornerRadius = 10
        loadTotalPrice()
    }

    @IBAction func gotToCheckout(_ sender: UIButton) {
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func loadTotalPrice() {
        let finalPrice = cart.finalPriceToPay()
        totalPriceLabel.text = "\(finalPrice)"
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.itemsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        
        cell.cartImage.image = UIImage(named: cart.itemsInCart[indexPath.row].image)
        cell.cartTitle.text = cart.itemsInCart[indexPath.row].title
        cell.cartPrice.text = "\(cart.itemsInCart[indexPath.row].price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
