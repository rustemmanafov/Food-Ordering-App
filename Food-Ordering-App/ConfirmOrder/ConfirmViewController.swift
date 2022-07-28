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
    
    var cardArray = ["1621472600_214508.png", "classic.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        payLbl.layer.cornerRadius = 10
        
        // image tapped
        collectioView.isUserInteractionEnabled = true
        collectioView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:))))
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        _ = tapGestureRecognizer.view as! UICollectionView
        cartNameTxt.text = "Rustam Manafli"
        PriceTxt.text = "10 Azn"
    }
    
    @IBAction func payAct(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Paid", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ConfirmViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        cell.cardImage.image = UIImage(named: cardArray[indexPath.row])
        return cell
    }
}
