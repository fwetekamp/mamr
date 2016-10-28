//
//  cookingstep.swift
//  mamr
//
//  Created by Fabian Wetekamp on 25/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class cookingstep: NSObject {
    var timerrequired: Bool = false
    var time = Int()
    var step = String()
    
    init(cookingstep:String, timer:Bool) {
    step = cookingstep
    timerrequired = timer
    }
    
    init(cookingstep:String, timer:Bool, steptime:Int) {
        step = cookingstep
        timerrequired = timer
        time = steptime
    }
}
