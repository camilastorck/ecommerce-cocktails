//
//  CartTableViewCell.swift
//  Cocktails
//
//  Created by Apple  on 02/06/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let identifier = "cartCell"
    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
