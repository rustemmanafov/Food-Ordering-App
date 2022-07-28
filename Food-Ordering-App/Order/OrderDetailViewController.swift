//
//  OrderDetailViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var orderDetailText: UITextView!
    @IBOutlet weak var orderDetailImage: UIImageView!
    
    var orderDetail: DishesModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        orderDetailImage.image = UIImage(named: orderDetail?.image ?? "")
        orderDetailText.text = orderDetail?.description
    }
    

}
