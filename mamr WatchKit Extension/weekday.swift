//
//  weekday.swift
//  mamr
//
//  Created by Fabian Wetekamp on 24/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class weekday: NSObject {
    
    static func getweekday() -> Int { //custom function to get the weekday. Frequently used. DRY!
    
    let date = NSDate()
    let calendar = NSCalendar.autoupdatingCurrent
    let datecomponents = calendar.dateComponents([.weekday], from: date as Date) //getting the current weekday
    let weekday = datecomponents.weekday
        return weekday!

}
}
