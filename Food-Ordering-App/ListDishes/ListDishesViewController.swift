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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addToBasket(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
        controller.addToBasket(dish: dishModel[index])
        navigationController?.show(controller, sender: nil)
    }
    
    func orderDetail(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        controller.orderDetail = dishModel[index]
        controller.title = dishModel[index].name
        navigationController?.show(controller, sender: nil)
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
    
}

