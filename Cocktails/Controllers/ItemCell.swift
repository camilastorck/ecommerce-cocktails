//
//  ItemCell.swift
//  Cocktails
//
//  Created by Apple  on 28/05/2022.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemSubtitle: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    static let identifier = "itemCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
