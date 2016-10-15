//
//  mamrpoints.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class mamrpoints: NSObject {
    var mamrBalance: Int = 0
    init(balance: Int)
    {
        mamrBalance = balance
    }
    func getPoints() -> Int{
        return mamrBalance
    }
    func updateBalance(update: Int){
        mamrBalance = mamrBalance + update
    }
}
