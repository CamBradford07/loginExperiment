//
//  ViewController2.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/17/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewController2: UIViewController {

    
    @IBOutlet weak var userNameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAction(_ sender: Any) {
        var username = userNameOutlet.text!
        var password = passwordOutlet.text!
        var userFound = false
        for usernameHi in AppData.usernames{
            if username.lowercased() == usernameHi.lowercased(){
                userFound = true
                break
            }
        }
        
        if (!userFound){
            var newPerson = Example(Password: password, Username: username)
            newPerson.saveToFirestore(docRef: AppData.ref)
        }else{
            print("User has been already added.")
        }
        
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
