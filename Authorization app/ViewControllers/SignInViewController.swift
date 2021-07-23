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
    
    private var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.navigationController?.present(vc!, animated: true)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func testButton(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

