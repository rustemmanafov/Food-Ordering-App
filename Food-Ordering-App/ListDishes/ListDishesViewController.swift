//
//  ListDishesViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class ListDishesViewController: UIViewController, DishesCollectionViewCellDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dishModel = [DishesModel]()
    
    let context = AppDelegate().persistentContainer.viewContext
    var basketItems = [Basket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
    }
    
     func fetch() {
        do{
            basketItems = try context.fetch(Basket.fetchRequest())
            basketItems.reverse()
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
    
    
    func addToBasket(index: Int) {
        save(title: String(index))
    }
    
    func orderDetail(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        controller.orderDetail = dishModel[index]
        controller.title = dishModel[index].name
        navigationController?.show(controller, sender: nil)
    }
    
    // need to be write codes
    func dishCount(index: Int) {
        print("worked")
        
    }
    
}

extension ListDishesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dishModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishesCollectionViewCell", for: indexPath) as! DishesCollectionViewCell
        cell.dishDescription.text = dishModel[indexPath.row].description
        cell.dishName.text = dishModel[indexPath.row].name
        cell.dishesImage.image = UIImage(named: dishModel[indexPath.row].image)
    
        // For protocol codes
        cell.delegate = self
        cell.tag = indexPath.row
        
        return cell
    }
    
    func actionAddBasketItems(index: Int) {
        addToBasket(index: index)
    }
    
    func actionDishDetail(index: Int) {
        orderDetail(index: index)
    }
    
    func actionCountDish(index: Int) {
        dishCount(index: index)
    }
    
}

