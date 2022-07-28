//
//  ConfirmViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var cartNameTxt: UITextField!
    @IBOutlet weak var PriceTxt: UITextField!
    @IBOutlet weak var payLbl: UIButton!
    
    var cardArray = ["image"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        payLbl.layer.cornerRadius = 10
       
    }
    
    @IBAction func payAct(_ sender: Any) {
        
    }
    

}

extension ConfirmViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        return cell
    }
    
    
    
}
