//
//  User.swift
//  PrintableObjectDemo
//
//  Created by Pierre on 09/06/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import Foundation
import PrintableObject

class User: BaseUser {
    var pseudo: String
    var lastName: String
    
    init(id: Int, name: String, pseudo: String, lastName: String) {
        self.pseudo = pseudo
        self.lastName = lastName
        
        super.init(id: id, name: name)
    }
}

class SubUser: User {
    var execute: Bool
    
    init(id: Int, name: String, pseudo: String, lastName: String, execute: Bool) {
        self.execute = execute
        
        super.init(id: id, name: name, pseudo: pseudo, lastName: lastName)
    }
}

struct UserStruct: PrintableObject {
    let pseudo: String
    let lastName: String
}
