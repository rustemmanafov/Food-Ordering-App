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
    
    //var profile: UserModel?
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel.layer.cornerRadius = 10
        logOutLabel.layer.cornerRadius = 10
        tabBarController?.tabBar.backgroundColor = .white
        
        readJsonFile()
    }
    
    func setupUI() {
        firstNameTxt.text = users[0].firstName
        lastNameTxt.text = users[0].lastName
        emailTxt.text = users[0].email
        passwordTxt.text = users[0].password
        genderTxt.text = users[0].gender
        ageTxt.text = users[0].age
    }
    
    func findLoggedUser() {
        let loggedMail = UserDefaults.standard.string(forKey: "loggedMail")

        for user in users {
            if(user.email == loggedMail) {
                users.append(user)
                setupUI()
            }
        }
    }
    
    func getJsonFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("User.json")
    }
    
    func readJsonFile() {
        if let data =  try? Data(contentsOf: getJsonFilePath()) {
            do {
                users = try JSONDecoder().decode([UserModel].self, from: data)
                findLoggedUser()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("no file")
        }
    }
    
    @IBAction func editAct(_ sender: Any) {
        // need to be write codes
    }
    
    @IBAction func logOutAct(_ sender: Any) {
        
        // for logout
        let sceneDelegate = SceneDelegate()
        sceneDelegate.navigateToOnboarding()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.show(controller, sender: nil)
    }
}
