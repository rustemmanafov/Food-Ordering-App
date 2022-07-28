//
//  DishesCollectionViewCell.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import UIKit

protocol DishesCollectionViewCellDelegate {
    func actionAddBasketItems(index: Int)
    func actionDishDetail(index: Int)
}

class DishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dishesImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var countDishLbl: UIStepper!
    @IBOutlet weak var dishesDetailLbl: UIButton!
    
    var delegate: DishesCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dishesDetailLbl.layer.cornerRadius = 10
        countDishLbl.minimumValue = 0
        countDishLbl.maximumValue = 10
    }
    
    @IBAction func addBasketBtn(_ sender: Any) {
        delegate?.actionAddBasketItems(index: tag)
    }
    
    @IBAction func dishesDetailAct(_ sender: Any) {
        delegate?.actionDishDetail(index: tag)
    }
    
    @IBAction func countDishes(_ sender: Any) {
        
    }
}
