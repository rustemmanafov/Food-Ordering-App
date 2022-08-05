//
//  StoreTableViewCell.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    var basketItems: Basket?

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var dishCountLbl: UILabel!
    @IBOutlet weak var dishPriceLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

}

