//
//  LoadViewController.swift
//  Authorization app
//
//  Created by Рустам Хайруллин on 24.07.2021.
//

import UIKit

class LoadViewController: UIViewController {
    private let users = Users()
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = storyboard?.instantiateViewController(identifier: "SignInViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
