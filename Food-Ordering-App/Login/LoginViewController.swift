//
//  LoginViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var notRegisteredOutlet: UIButton!
    
    var users = [UserModel]()
    var jsonData = URL(string: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()

        underlineButton()
    }
    
    // Underline Button first code
    fileprivate func underlineButton() {
        let attributeString = NSMutableAttributedString(
            string: "Not Registered",
            attributes: yourAttributes)
        notRegisteredOutlet.setAttributedTitle(attributeString, for: .normal)
    }
    
    // Underline Button second code
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18),
        .foregroundColor: UIColor.black,
        .underlineStyle: NSUnderlineStyle.single.rawValue ]
    
    
    
    @IBAction func signInAct(_ sender: Any) {
        
        
    }
    
    @IBAction func notRegisteredAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
       // controller.modalTransitionStyle = .flipHorizontal
        show(controller, sender: nil)
       // present(controller, animated: true, completion: nil)

        
    }
    
   
}
