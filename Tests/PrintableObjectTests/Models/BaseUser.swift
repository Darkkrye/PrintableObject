//
//  BaseUser.swift
//  PrintableObjectDemo
//
//  Created by Pierre on 09/06/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import Foundation
import PrintableObject

class BaseUser: PrintableObject {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
