//
//  RegisterViewController.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 24.07.22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var signUpTextField: UIButton!
    
    var users = [UserModel]()
    var pickerView = UIPickerView()
    var dataPicker = UIDatePicker()
    var genderArr = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpTextField.layer.cornerRadius = 10
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
        emailTextField.keyboardType = .emailAddress
        createDatePicker()
        genderTextField.text = "Male"

    }
    
    func createDatePicker() {
        
        ageTextField.textAlignment = .center
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        ageTextField.inputAccessoryView = toolBar
        ageTextField.inputView = dataPicker
        dataPicker.datePickerMode = .date

    }
    
    @objc func donePressed() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        ageTextField.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func signUpAct(_ sender: Any) {
                
        if let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let gender = genderTextField.text, let age = ageTextField.text {
                        
            let user = UserModel(firstName: firstName, lastName: lastName, email: email, password: password, gender: gender, age: age)
            users.append(user)
            writeToJsonFile()

        } else {
            let alert = UIAlertController(title: "Alert", message: "Please fill fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func getDocumentPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
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
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("no file")
        }
    }
    
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getJsonFilePath())
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// gender picker view
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            genderTextField.text = genderArr[row]
            genderTextField.resignFirstResponder()

    }
}
