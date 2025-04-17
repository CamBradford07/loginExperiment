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
    
    
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAction(_ sender: Any) {
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
