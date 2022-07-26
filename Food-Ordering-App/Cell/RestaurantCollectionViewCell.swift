//
//  RestaurantCollectionViewCell.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import UIKit

protocol RestaurantCollectionViewCellDelegate {
    func actionButtonCalled(index: Int)
    func actionRestaurantDetailCalled(index: Int)
}

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantDesc: UILabel!
    
    var delegate: RestaurantCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Add action feature to Image view
        restaurantImage.isUserInteractionEnabled = true
        restaurantImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:))))
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        _ = tapGestureRecognizer.view as! UIImageView
        delegate?.actionButtonCalled(index: tag)
    }
    
    @IBAction func restaurantDetailsBtn(_ sender: Any) {
        
        delegate?.actionRestaurantDetailCalled(index: tag)
    }
}
