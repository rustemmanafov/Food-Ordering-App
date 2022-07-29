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
    
    let context = AppDelegate().persistentContainer.viewContext
    var basketItems = [Basket]()

    var orders = [DishesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addToBasketLbl.layer.cornerRadius = 10
        
        fetch()
       // jsonSetup()
    }
    
//    func jsonSetup() {
//
//        if let jsonFile = Bundle.main.url(forResource: "Restaurant", withExtension: "json"), let data = try? Data(contentsOf: jsonFile){
//            do {
//                orders = try JSONDecoder().decode([DishesModel].self, from: data)
//                tableView.reloadData()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func fetch() {
        do{
            basketItems = try context.fetch(Basket.fetchRequest())
            basketItems.reverse()
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func save(title: String) {
        let model = Basket(context: context)
        model.title = title
        do {
            try context.save()
            fetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func delete(index: Int) {
//        context.delete(basketItems[index])
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
   
    
    // order add to basket
    func addToBasket(dish: DishesModel) {
        orders.append(dish)
        
    }
    
    @IBAction func confirmOrderAct(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        
        show(controller, sender: nil)
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
