//
//  SignUpViewController.swift
//  Authorization app
//
//  Created by Рустам Хайруллин on 23.07.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameErrorMessageLabel: UILabel!
    @IBOutlet weak var secondNameErrorMessageLabel: UILabel!
    @IBOutlet weak var emailErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessage: UILabel!
    @IBOutlet weak var secureButton: UIButton!
    
    private var passwordIsHidden = true
    private var signUpData: User?
    private let users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Проверка на корректность почты
    private func emailIsCorrect() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailTextField.text)
    }
    
    // провера на корректность пароля
    private func passwordIsCorrect() -> Bool{
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{6,}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return emailPred.evaluate(with: passwordTextField.text)
    }
    
    
    //Проверка полей на привильный ввод
    private func allFieldsAreCorrect() -> Bool{
        var name = ""
        if nameTextField.text != nil{
            name = nameTextField.text!
        }
        var secondName = ""
        if secondNameTextField.text != nil{
            secondName = secondNameTextField.text!
        }
        
        if name.isEmpty || secondName.isEmpty || !emailIsCorrect() || !passwordIsCorrect(){
            if name.isEmpty{
                nameErrorMessageLabel.isHidden = false
            }else{
                nameErrorMessageLabel.isHidden = true
            }
            
            if secondName.isEmpty{
                secondNameErrorMessageLabel.isHidden = false
            }else{
                secondNameErrorMessageLabel.isHidden = true
            }
            
            if !emailIsCorrect(){
                emailErrorMessageLabel.isHidden = false
            }else{
                emailErrorMessageLabel.isHidden = true
            }
            
            if !passwordIsCorrect(){
                passwordErrorMessage.isHidden = false
            }else{
                passwordErrorMessage.isHidden = true
            }
            return false
        }else {
            nameErrorMessageLabel.isHidden = true
            secondNameErrorMessageLabel.isHidden = true
            emailErrorMessageLabel.isHidden = true
            passwordErrorMessage.isHidden = true
            return true
        }
    }
    
    // Кнопка регистрации
    @IBAction func signUpButton(_ sender: Any) {
        if allFieldsAreCorrect() && !accountAlreadyExists(){
            let name = nameTextField.text ?? ""
            let secondName = secondNameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            var newUser = User(name: name, secondName: secondName, email: email, password: password)
            newUser.isSignIn = true
            signUpData = newUser
            users.saveNewAccount(account: signUpData!)
            UserData.sharedInstance.user = signUpData
            
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    // Переключатель видимости пароля
    @IBAction func hidePasswordButton(_ sender: Any) {
        if passwordIsHidden{
            passwordTextField.isSecureTextEntry = false
            secureButton.tintColor = .systemBlue
            passwordIsHidden = false
        } else{
            passwordTextField.isSecureTextEntry = true
            secureButton.tintColor = .systemGray
            passwordIsHidden = true
        }
    }
    
    // Проверка на уже зарегистрированную почту
    private func accountAlreadyExists() -> Bool{
        var alreadyExist = false
        for account in users.accounts{
            if emailTextField.text == account.email{
                alreadyExist = true
                let alert = UIAlertController(title: "Email alert", message: "This account is already registered.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                break
            }
        }
        return alreadyExist
    }
}
