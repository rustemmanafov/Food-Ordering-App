//
//  ProfileViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var editLabel: UIButton!
    @IBOutlet weak var logOutLabel: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editLabel.layer.cornerRadius = 10
        logOutLabel.layer.cornerRadius = 10

      
    }
    
    @IBAction func editAct(_ sender: Any) {
    }
    
    @IBAction func logOutAct(_ sender: Any) {
    }
    
}
