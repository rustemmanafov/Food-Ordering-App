//
//  OrdersViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit
import ProgressHUD

class OrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToBasketLbl: UIButton!
    @IBOutlet weak var orderPrice: UILabel!
  
    var orders = [DishesModel]()
    let context = AppDelegate().persistentContainer.viewContext
    var basketItems = [Basket]()
    
    var totalBasketPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToBasketLbl.layer.cornerRadius = 10
            

    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetch()
        calculateTotalPrice()
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
    
    func calculateTotalPrice (){
        for order in basketItems {
            let numberOfPiece = Int(order.count ?? "0") ?? 0
            let price = Int(order.price ?? "0") ?? 0
            let totalPrice = numberOfPiece * price
            totalBasketPrice += totalPrice
            
        }
        
        orderPrice.text = String( totalBasketPrice) + " azn"

    }
    
    func delete(index: Int) {
        context.delete(basketItems[index])
        do {
            try context.save()
            ProgressHUD.showSuccess()
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
        cell.dishDescription.text = basketItems[indexPath.row].info
        cell.dishImageView.image = UIImage(named: basketItems[indexPath.row].image ?? "")
       
        let numberOfPiece = Int(basketItems[indexPath.row].count ?? "0") ?? 0
        let price = Int(basketItems[indexPath.row].price ?? "0") ?? 0
        let totalPrice = numberOfPiece * price
        cell.dishCountLbl.text = (basketItems[indexPath.row].count ?? "") + " pcs"
        cell.dishPriceLbl.text = "\(totalPrice) azn"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(index: indexPath.row)
            basketItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
