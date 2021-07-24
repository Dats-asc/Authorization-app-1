//
//  ProfileViewController.swift
//  Authorization app
//
//  Created by Рустам Хайруллин on 23.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var logOutButtonView: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var emalLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPersonData()
    }
    
    private func setPersonData(){
        let account = UserData.sharedInstance.user
        nameLabel.text = account?.name
        secondNameLabel.text = account?.secondName
        emalLabel.text = account?.email
        let name = account?.name ?? ""
        greetingLabel.text = "Welcome, " + name + "!"
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        for i in 0..<users.accounts.count{
            if users.accounts[i].email == UserData.sharedInstance.user?.email{
                users.accounts[i].isSignIn = false
            }
        }
    }
}
