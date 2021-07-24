//
//  ViewController.swift
//  Authorization app
//
//  Created by Рустам Хайруллин on 21.07.2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordToggleIcon: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var remeberSwitch: UISwitch!
    
    private var passwordIsHidden = true
    private var users = Users()
    private var userFunded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        if foundLogedInUser() == true{
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    // переключатель видимости пароля
    @IBAction func passwordToggleAction(_ sender: Any) {
        if passwordIsHidden{
            passwordToggleIcon.tintColor = UIColor.systemBlue
            passwordTextField.isSecureTextEntry = false
            passwordIsHidden = false
        }
        else {
            passwordToggleIcon.tintColor = UIColor.systemGray
            passwordTextField.isSecureTextEntry = true
            passwordIsHidden = true
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        for i in 0..<users.accounts.count{
            if emailTextField.text == users.accounts[i].email{
                if passwordTextField.text == users.accounts[i].password{
                    userFunded = true
                    if remeberSwitch.isOn{
                        users.accounts[i].isSignIn = true
                    }
                    UserData.sharedInstance.user = users.accounts[i]
                    break
                } else{
                    let alert = UIAlertController(title: "Uncorrect password", message: "Uncorrect password. Try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        if userFunded{
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController")
            self.navigationController?.pushViewController(vc!, animated: true)
        } else{
            let alert = UIAlertController(title: "Not found", message: "User not founded.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    private func foundLogedInUser() -> Bool{
        var logedInExist = false
        for account in users.accounts{
            if account.isSignIn{
                UserData.sharedInstance.user = account
                logedInExist = true
                break
            }
        }
        return logedInExist
    }
}

