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
    
    init(id: Int, name: String, pseudo: String, lastName: String) {
        self.pseudo = pseudo
        self.lastName = lastName
        
        super.init(id: id, name: name)
    }
}
