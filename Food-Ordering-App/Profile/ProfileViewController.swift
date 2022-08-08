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
    
    var profile: UserModel?
    var jsonData = URL(string: "")
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel.layer.cornerRadius = 10
        logOutLabel.layer.cornerRadius = 10
        tabBarController?.tabBar.backgroundColor = .white
        
        jsonCalled()
    }
    
    func setupUI() {
        firstNameTxt.text = profile?.firstName
        lastNameTxt.text = profile?.lastName
        emailTxt.text = profile?.email
        passwordTxt.text = profile?.password
        genderTxt.text = profile?.gender
        ageTxt.text = profile?.gender
    }
    
    func findLoggedUser() {
        let loggedMail = UserDefaults.standard.string(forKey: "loggedMail")
        
        for user in users {
            if(user.email == loggedMail) {
                profile = user
                setupUI()
            }
        }
    }
    
    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func jsonCalled() {
        jsonData = getDocumentsDirectoryUrl().appendingPathComponent("User.json")
        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([UserModel].self, from: data)
                findLoggedUser()
            } catch {
                print(error.localizedDescription)
                print("error")
            }
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
