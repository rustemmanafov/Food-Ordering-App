//
//  DishesCollectionViewCell.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import UIKit

protocol DishesCollectionViewCellDelegate {
    func actionAddBasketItems(index: Int)
}


class DishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dishesImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    
    var delegate: DishesCollectionViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func addBasketBtn(_ sender: Any) {
        delegate?.actionAddBasketItems(index: tag)
        
    }
}
