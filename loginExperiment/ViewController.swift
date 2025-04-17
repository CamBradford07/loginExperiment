//
//  ViewController.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/16/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: UIButton) {
        
    }
    
    @IBAction func newAccountAction(_ sender: UIButton) {
        performSegue(withIdentifier: "newAccount", sender: self)
    }
}

