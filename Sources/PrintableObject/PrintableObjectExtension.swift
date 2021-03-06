//
//  PrintableObjectExtension
//  
//
//  Created by Pierre on 09/06/2019.
//

import Foundation

public extension PrintableObject {
    func fullPrint() {
        print(getPrintableString())
    }
    
    func partialPrint() {
        print(getPrintableString(isFull: false))
    }
    
    internal func getPrintableString(isFull: Bool = true) -> String {
        var description: String = "==============================\n"
        let className = type(of: self)
        
        description += "**** \(className) ****\n"
        
        // Print each properties of class
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "- \(propertyName): \(child.value) (\(type(of: child.value)))\n"
            }
        }
        
        if isFull {
            // Print properties of top class
            if let parent = selfMirror.superclassMirror {
                description += getSuperclass(parentMirror: parent)
            }
        }
        
        description += "=============================="
        
        return description
    }
    
    private func getSuperclass(parentMirror: Mirror) -> String {
        var description = ""
    
        let parentName = parentMirror.description.replacingOccurrences(of: "Mirror for ", with: "")
        
        if !parentName.contains("NSObject") && !parentName.starts(with: "NS") && !parentName.starts(with: "UI") {
            description += "\n----- Superclass - \(parentName) -----\n"
            
            for parentChild in parentMirror.children {
                if let propertyName = parentChild.label {
                    description += "- \(propertyName): \(parentChild.value) (\(type(of: parentChild.value)))\n"
                }
            }
        }
        
        if let parent = parentMirror.superclassMirror {
            description += getSuperclass(parentMirror: parent)
        }
        
        return description
    }
}
