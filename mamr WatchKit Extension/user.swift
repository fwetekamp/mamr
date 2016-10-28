//
//  user.swift
//  mamr
//
//  Created by Fabian Wetekamp on 28/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var newuser: Bool
    
    // Defining Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("userstatus")
    
    struct PropertyKey {
        static let nameKey = "user" //define key vor key-value pair
    }
    
    init?(newuser: Bool) {
        // Initialize stored properties.
        self.newuser = newuser
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        
    } //save balance
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(newuser, forKey: "user")
    } //get balance
    
    required init?(coder aDecoder: NSCoder) {
        self.newuser = aDecoder.decodeBool(forKey: "user")
        super.init()
    }
}
