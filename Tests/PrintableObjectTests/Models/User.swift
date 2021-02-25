//
//  User.swift
//  PrintableObjectDemo
//
//  Created by Pierre on 09/06/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import Foundation
import PrintableObject

class User: BaseUser, PrintableObject {
    var pseudo: String
    var lastName: String
    var execute: Bool
    
    init(id: Int, name: String, pseudo: String, lastName: String, execute: Bool) {
        self.pseudo = pseudo
        self.lastName = lastName
        self.execute = execute
        
        super.init(id: id, name: name)
    }
}

struct UserStruct: PrintableObject {
    let pseudo: String
    let lastName: String
    let execute: Bool
}
