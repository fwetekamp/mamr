//
//  User.swift
//  testingpersistence2
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//
//


import UIKit

class User: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
    }
    
    // MARK: Initialisation
    
    init?(name: String) {
        // Initialize stored properties.
        self.name = name
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty{
            return nil
        }
    }
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: PropertyKey.nameKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        // Must call designated initializer.
        self.init(name: name)
    }
    
    
}
