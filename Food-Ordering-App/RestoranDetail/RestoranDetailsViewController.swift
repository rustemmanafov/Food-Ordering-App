//
//  RestoranDetailsViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class RestoranDetailsViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantDetailText: UITextView!
    @IBOutlet weak var showLocationLbl: UIButton!
    
    var restaurantDetail: RestaurantModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLocationLbl.layer.cornerRadius = 10
        
        title = restaurantDetail?.name
        restaurantImage.image = UIImage(named: restaurantDetail?.image ?? "")
        restaurantDetailText.text = restaurantDetail?.description
    }
    
    @IBAction func showLocation(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        controller.latitude = restaurantDetail?.coordinatex ?? ""
        controller.longitude = restaurantDetail?.coordinatey ?? ""
        show(controller, sender: nil)
    }
}
