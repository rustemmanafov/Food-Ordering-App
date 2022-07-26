//
//  HomeViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class HomeViewController: UIViewController, RestaurantCollectionViewCellDelegate {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var restaurants = [RestaurantModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

     jsonSetup()

    }
    
    func jsonSetup() {

        if let jsonFile = Bundle.main.url(forResource: "Restaurant", withExtension: "json"), let data = try? Data(contentsOf: jsonFile){

            do{
                restaurants = try JSONDecoder().decode([RestaurantModel].self, from: data)
                collectionView.reloadData()

            }catch{
                print(error.localizedDescription)

            }
        }

    }
    
    func navigate(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListDishesViewController") as! ListDishesViewController
        controller.dishModel = restaurants[index].dishes
        controller.title = restaurants[index].name
        navigationController?.show(controller, sender: nil)
    }
    
    func RestaurantDetailsCalled(index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RestoranDetailsViewController") as! RestoranDetailsViewController
        controller.restaurantDetail = restaurants[index]
        controller.title = restaurants[index].name
        navigationController?.show(controller, sender: nil)
    }

    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCollectionViewCell", for: indexPath) as! RestaurantCollectionViewCell
        cell.restaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.restaurantName.text = restaurants[indexPath.row].name
        cell.restaurantDesc.text = restaurants[indexPath.row].description
        
        cell.delegate = self
        cell.tag = indexPath.row
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "ListDishesViewController") as! ListDishesViewController
//
//        show(controller, sender: nil)
//    }
    
    
    func actionButtonCalled(index: Int) {
       navigate(index: index)
    }
    

    func actionRestaurantDetailCalled(index: Int) {
        RestaurantDetailsCalled(index: index)
    }
    
}
