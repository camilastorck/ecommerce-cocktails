//
//  HomeViewController.swift
//  Cocktails
//
//  Created by Apple on 28/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var items: [Item] = [
        Item(title: "Margarita", description: "Ladfghjkjhgf ddfghjkkjhg", price: 10.50, image: "house.fill"),
        Item(title: "Vodka", description: "Ladfghjkjhgf ddfghjkkjhg", price: 10.50, image: "house.fill"),
        Item(title: "Cerveza", description: "Ladfghjkjhgf ddfghjkkjhg", price: 10.50, image: "house.fill"),
        Item(title: "Vino", description: "Ladfghjkjhgf ddfghjkkjhg", price: 10.50, image: "house.fill")
    ]
    
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
        title = "Cocktails"
        collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: ItemCell.identifier)
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/7)), subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.itemImage.image = UIImage(systemName: items[indexPath.row].image)
        cell.itemTitle.text = items[indexPath.row].title
        cell.itemSubtitle.text = items[indexPath.row].description
        cell.itemPrice.text = "\(items[indexPath.row].price)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itemSelected = items[indexPath.row]
        notifications.action.send(itemSelected)
        navigationController?.pushViewController(ItemViewController(notifications: NotificationActions()), animated: true)
    }
    
}
