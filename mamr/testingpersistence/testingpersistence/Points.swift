//
//  Pointsiphone.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import Foundation

class Points: NSObject, NSCoding { //using NSCoding for simple data persistence
    
    struct Keys {
        static let Balance = "balance" //static variable to make them accessible without creating an ojbect
    }
    
    // Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("points")
    
    
    private var _balance = 0
    
    init(balance: Int) {
        self._balance = balance
    }
    override init() {}
    
    required init(coder decoder : NSCoder) { //decodes object (loading)
        if let balanceObj = decoder.decodeObject(forKey: Keys.Balance) as? Int //optional because can or cannot return a value, trying to get it as Int
        {
            _balance = balanceObj  //if balance can be decoded, set it balance to balanceInt
            
        }
        
    }
    
    func encode (with coder: NSCoder) { //encodes object (saving)
        coder.encode(_balance, forKey: Keys.Balance)
    }
    
    var Balance: Int {
        get {
            return _balance
        }
        set {
            _balance = newValue
        }
    }
}

