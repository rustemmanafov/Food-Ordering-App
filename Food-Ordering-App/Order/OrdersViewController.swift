//
//  OrdersViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders = [DishesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func addToBasket(dish: DishesModel) {
        orders.append(dish)
    }
    
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        cell.dishName.text = orders[indexPath.row].name
        cell.dishDescription.text = orders[indexPath.row].description
        cell.dishImageView.image = UIImage(named: orders[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
