//
//  Profile.swift
//  Authorization app
//
//  Created by Рустам Хайруллин on 23.07.2021.
//

import Foundation

let defaults = UserDefaults.standard

struct User: Codable  {
    var name: String
    var secondName: String
    var email: String
    var password: String
    var isSignIn = false
}

class Users {
    let defaults = UserDefaults.standard
    
    var accounts: [User]{
        get{
            if let data = defaults.value(forKey: "accounts") as? Data{
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else{
                return [User]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.setValue(data, forKey: "accounts")
            }
        }
    }
    
    func saveNewAccount(account: User){
        accounts.append(account)
    }
}

class UserData {
    static let sharedInstance = UserData()
    
    public var user: User?
    
    private init(){
        
    }
}
