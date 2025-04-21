//
//  ViewController.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/16/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
class AppData{
    static var ref: DocumentReference!
    static var usernames = [String]()
    static var passwords = [String]()
}

class ViewController: UIViewController {
    @IBOutlet weak var usernameFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordFieldOutlet: UITextField!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.ref = Firestore.firestore().collection("data").document("Accounts")
        
        AppData.ref.addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                  print("Error fetching document: \(error!)")
                  return
                }
                guard let data = document.data() else {
                  print("Document data was empty.")
                  return
                }
            
            AppData.usernames.removeAll()
            AppData.passwords.removeAll()
            
            for key in data.keys{
                    let dataArray = data[key] as! [String : Any]
                    let uncodedAccount = Example(dict: dataArray)
                    AppData.usernames.append(uncodedAccount.Username)
                    AppData.passwords.append(uncodedAccount.Password)
            }
            
            
              }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: UIButton) {
        let enteredUsername = usernameFieldOutlet.text!
        let enteredPassword = passwordFieldOutlet.text!
        
        var userFound = false
        var userIndex = -1
        for username in AppData.usernames{
            if enteredUsername == username{
                userFound = true
                userIndex = AppData.usernames.firstIndex(of: enteredUsername) ?? -1
                break
            }
        }
        
        if userFound && userIndex != -1{
            if enteredPassword == AppData.passwords[userIndex]{
                performSegue(withIdentifier: "loginSuccess", sender: self)
            }
        }
    }
    
    @IBAction func newAccountAction(_ sender: UIButton) {
        performSegue(withIdentifier: "newAccount", sender: self)
    }
}

