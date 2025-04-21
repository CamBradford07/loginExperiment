//
//  Example.swift
//  loginExperiment
//
//  Created by CAMERON BRADFORD on 4/21/25.
//

import Foundation

struct Example {
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
}
