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
    func stepperButton(sender: DishesCollectionViewCell)
}

class DishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dishesImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var countDishLbl: UIStepper!
    @IBOutlet weak var dishesDetailLbl: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
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
        if delegate != nil {
            delegate?.stepperButton(sender: self)
            countLabel.text = "x \(Int(countDishLbl.value))"

            }
    }
}
