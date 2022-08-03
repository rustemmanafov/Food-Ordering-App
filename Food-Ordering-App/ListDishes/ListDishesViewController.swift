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
        
    }

    func save(title: String, image: String, info: String, count: String) {
        let model = Basket(context: context)
        model.title = title
        model.image = image
        model.info = info
        model.count = count
        
        do {
            try context.save()
            //fetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    

    func addToBasket(title: String, image: String, info: String, count: String) {
        save(title: title, image: image, info: info, count: count)
        
    }
    
    func orderDetail(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        controller.orderDetail = dishModel[index]
        controller.title = dishModel[index].name
        navigationController?.show(controller, sender: nil)
    }
    
//    func dishCount(index: Int) {
//    }
    
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
        cell.countLabel.text = dishModel[indexPath.row].count

        // For protocol codes
        cell.delegate = self
        cell.tag = indexPath.row
        
        return cell
    }
  
    func actionAddBasketItems(index: Int) {
       
        addToBasket(title: dishModel[index].name, image: dishModel[index].image, info: dishModel[index].description, count: dishModel[index].count)
    }
    
    func actionDishDetail(index: Int) {
        orderDetail(index: index)
    }
    
    func stepperButton(sender: DishesCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: sender){
               print(indexPath)
           }
    
        
    }
    
    
    
}

    
