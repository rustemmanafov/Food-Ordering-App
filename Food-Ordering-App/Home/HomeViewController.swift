//
//  HomeViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class HomeViewController: UIViewController {

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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: <#T##String#>)
    }
    

    
    
    
}
