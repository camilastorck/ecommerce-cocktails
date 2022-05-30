//
//  ItemViewController.swift
//  Cocktails
//
//  Created by Apple on 28/05/2022.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    private let notifications: NotificationActions
    
    init(notifications: NotificationActions) {
        self.notifications = notifications
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.layer.cornerRadius = 20
        addToCartOutlet.layer.cornerRadius = 10
        setUpItemInformation()
    }

    @IBAction func addToCartButton(_ sender: UIButton) {
        
    }
    
    private func setUpItemInformation() {
        notifications.action.sink { item in
            self.itemTitle.text = item.title
            self.itemDescription.text = item.description
            self.itemPrice.text = "\(item.price)"
            self.itemImage.image = UIImage(systemName: item.image)
        }
        .store(in: &notifications.cancellables)
    }
}
