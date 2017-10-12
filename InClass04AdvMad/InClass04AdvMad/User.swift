//
//  User.swift
//  InClass04AdvMad
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import Foundation

class User{
    
    var nameStr: String?
    var passStr: String?
    var emailStr: String?
    var deptStr: String?
    
    
    init(name:String?,email:String?,password:String?,dept:String?){
        self.nameStr = name
        self.passStr = password
        self.emailStr = email
        self.deptStr = dept
    }
    
    init(){
        
    }

    
    
}
