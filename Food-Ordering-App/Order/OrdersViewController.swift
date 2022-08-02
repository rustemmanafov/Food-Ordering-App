//
//  OrdersViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToBasketLbl: UIButton!

    var orders = [DishesModel]()
    let context = AppDelegate().persistentContainer.viewContext
    var basketItems = [Basket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addToBasketLbl.layer.cornerRadius = 10
       
       // fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetch()
    }
    
    func fetch() {
       do {
           basketItems = try context.fetch(Basket.fetchRequest())
           basketItems.reverse()
           tableView.reloadData()

       } catch {
           print(error.localizedDescription)
       }
   }
    
    // order add to basket
//    func addToBasket(dish: DishesModel) {
//        orders.append(dish)
//    }
    
    @IBAction func confirmOrderAct(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        
        show(controller, sender: nil)
    }
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        cell.dishName.text = basketItems[indexPath.row].title
//        cell.dishDescription.text = basketItems[indexPath.row].description
//        cell.dishImageView.image = UIImage(named: basketItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
