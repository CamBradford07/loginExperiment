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

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }


}

