//
//  Example.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/21/25.
//

import Foundation
import FirebaseFirestore


class Example {
    var Password : String!
    var Username : String!
    
    init(dict : [String: Any]) {
        if let pass = dict["Password"] as? String{
            Password = pass
        }
        else{Password = ""}
        if let user = dict["Username"] as? String{
            Username = user
        }
        else {Username = ""}
    }
    
    init(Password: String, Username: String){
        self.Password = Password
        self.Username = Username
    }
    
    func saveToFirestore(docRef: DocumentReference){
        let uploadableDict = ["Username" : Username, "Password" : Password] as! [String : Any]
        let finishedDict = [Username : uploadableDict] as! [String : Any]
        docRef.setData(finishedDict, merge: true)
    }
    
}
