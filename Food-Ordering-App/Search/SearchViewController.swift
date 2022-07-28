//
//  SearchViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchRestaurant = [RestaurantModel]()
    var searchDishes = [DishesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonSetup()
    }
    
    func jsonSetup() {

        if let jsonFile = Bundle.main.url(forResource: "Restaurant", withExtension: "json"), let data = try? Data(contentsOf: jsonFile){
            do {
                searchRestaurant = try JSONDecoder().decode([RestaurantModel].self, from: data)
                tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.searchLabel.text = searchRestaurant[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RestoranDetailsViewController") as! RestoranDetailsViewController
        controller.restaurantDetail = searchRestaurant[indexPath.row]
        show(controller, sender: nil)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        // need to be write code
    }
}
