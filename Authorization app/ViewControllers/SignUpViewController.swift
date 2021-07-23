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

    @IBAction func signUpButton(_ sender: Any) {
        if allFieldsAreCorrect(){
            
        }
    }
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
}
