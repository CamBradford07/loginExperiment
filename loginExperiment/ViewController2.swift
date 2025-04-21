//
//  ViewController2.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/17/25.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class ViewController2: UIViewController {

    
    @IBOutlet weak var userNameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAction(_ sender: Any) {
        let enteredUsername = userNameOutlet.text!
        let enteredPassword = passwordOutlet.text!
        
        var userFound = false
        for username in AppData.usernames{
            if enteredUsername.lowercased() == username.lowercased(){
                userFound = true
                break
            }
        }
        
        if !userFound{
            let newUser = Example(dict: [enteredUsername:enteredPassword])
            
//            AppData.ref.updateData([newUser.Password:newUser.Username])
            
            print("wow! you made an account!")
        }else{
            print("there's already an account with that name make something new")
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
