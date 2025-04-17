//
//  ViewController.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/16/25.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet weak var usernameFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: UIButton) {
        
    }
    
    @IBAction func newAccountAction(_ sender: UIButton) {
        performSegue(withIdentifier: "newAccount", sender: self)
    }
}

