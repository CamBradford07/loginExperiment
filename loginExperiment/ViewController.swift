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
}

class ViewController: UIViewController {
    @IBOutlet weak var usernameFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordFieldOutlet: UITextField!
        
    var usernames = [String]()
    var passwords = [String]()
    
    
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
            
            self.usernames.removeAll()
            self.passwords.removeAll()
            
            for key in data.keys{
                    let dataArray = data[key] as! [String : Any]
                    let uncodedAccount = Example(dict: dataArray)
                    self.usernames.append(uncodedAccount.Username)
                    self.passwords.append(uncodedAccount.Password)
            }
            
            print(self.usernames)
            print(self.passwords)
            
              }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: UIButton) {
        let enteredUsername = usernameFieldOutlet.text!
        let enteredPassword = passwordFieldOutlet.text!
        
        var userFound = false
        var userIndex = -1
        for username in usernames{
            if enteredUsername == username{
                userFound = true
                userIndex = usernames.firstIndex(of: enteredUsername) ?? -1
                break
            }
        }
        
        if userFound && userIndex != -1{
            if enteredPassword == passwords[userIndex]{
                performSegue(withIdentifier: "success", sender: self)
            }
        }
    }
    
    @IBAction func newAccountAction(_ sender: UIButton) {
        performSegue(withIdentifier: "newAccount", sender: self)
    }
}

