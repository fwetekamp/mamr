//
//  step1controller.swift
//  mamr
//
//  Created by Fabian Wetekamp on 25/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class step1controller: WKInterfaceController {
    let dish = Dinner(day: weekday.getweekday())

    @IBOutlet var cookingtimer: WKInterfaceTimer!
    
    @IBOutlet var instructions: WKInterfaceLabel!
override func awake(withContext context: Any?) {
        instructions.setText(dish.step1.step)
    let date = Date(timeIntervalSinceNow: TimeInterval(dish.step1.time*60+1)) //configuring the cookingtimer
    cookingtimer.setHidden(!dish.step1.timerrequired) //cookingtimer will be hidden if false flag is set on step object

    cookingtimer.setDate(date)
    
        super.awake(withContext: context)
    
    
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
