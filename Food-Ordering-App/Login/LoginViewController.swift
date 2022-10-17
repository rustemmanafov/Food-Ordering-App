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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInOutlet.layer.cornerRadius = 10
        underlineButton()
        
        // auto filling textfields when opening login view
        emailTextField.text = "rustam1@gmail.com"
        passwordTextField.text = "12345"
    }
    override func viewWillAppear(_ animated: Bool) {
        readJsonFile()
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
    
    func getJsonFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("User.json")
    }
    
    func readJsonFile() {
        if let data =  try? Data(contentsOf: getJsonFilePath()) {
            do {
                users = try JSONDecoder().decode([UserModel].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("No file")
        }
    }
    
    func checkUser() -> Bool {
        if let email = emailTextField.text, let password = passwordTextField.text {
            for user in users {
                if user.email == email && user.password == password {
                    print("User logged in")
                    UserDefaults.standard.set(user.email, forKey: "loggedMail")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    return true
                }
            }
        } else {
            print("Fill the information")
        }
        return false
    }
    
    @IBAction func signInAct(_ sender: Any) {
        if checkUser() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .overFullScreen
            present(navigationController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func notRegisteredAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        show(controller, sender: nil)
        
    }
}
