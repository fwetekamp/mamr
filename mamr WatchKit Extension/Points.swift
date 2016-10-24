//
//  mamrpoints.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Points: NSObject, NSCoding {

    var balance: Int
    
    // Defining Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("mamrpoints6")
    
    struct PropertyKey {
        static let nameKey = "balance" //define key vor key-value pair
    }
    
    init?(balance: Int) {
        // Initialize stored properties.
        self.balance = balance
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        
    } //save balance
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: "balance")
    } //get balance
    
    required init?(coder aDecoder: NSCoder) {
        self.balance = aDecoder.decodeInteger(forKey: "balance")
        super.init()
    }
}

