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
    func stepperButton(value: Int)
}

class DishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dishesImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var dishesDetailLbl: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var priceLabel: UILabel!
    
    var delegate: DishesCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dishesDetailLbl.layer.cornerRadius = 10
        stepper.minimumValue = 0
        stepper.maximumValue = 10
    }
    
    @IBAction func addBasketBtn(_ sender: Any) {
        delegate?.actionAddBasketItems(index: tag)
    }
    
    @IBAction func dishesDetailAct(_ sender: Any) {
        delegate?.actionDishDetail(index: tag)
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        if delegate != nil {
            delegate?.stepperButton(value: Int(stepper.value))
            countLabel.text = "x \(Int(stepper.value))"
            }
    }
   
}
