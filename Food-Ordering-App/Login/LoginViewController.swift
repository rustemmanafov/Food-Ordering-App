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

        signInOutlet.layer.cornerRadius = 10
        underlineButton()
        jsonData = getDocumentsDirectoryUrl().appendingPathComponent("User.json")

        // auto filling textfields when opening login view
        emailTextField.text = "rustem@mail.com"
        passwordTextField.text = "12345"
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
    
    
    func getDocumentsDirectoryUrl() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonCalled() {
        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([UserModel].self, from: data)
            } catch {
                print(error.localizedDescription)

            }
        }

    }
    
    func checkUsers() -> Bool {
        var i = 0
        while i < users.count {
            if emailTextField.text == users[i].email && passwordTextField.text == users[i].password {
                //for profile vc
                UserDefaults.standard.setValue(users[i].email, forKey: "loggedMail")
                return true
            }
            i += 1
        }
        return false
    }
    
    
    
    @IBAction func signInAct(_ sender: Any) {
        jsonCalled()
        
        if checkUsers() {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")  // FLAG
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .overFullScreen
            present(navigationController, animated: true, completion: nil)
            
        } else{
            let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func notRegisteredAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
       // controller.modalTransitionStyle = .flipHorizontal
        show(controller, sender: nil)
       // present(controller, animated: true, completion: nil)

        
    }
    
   
}
