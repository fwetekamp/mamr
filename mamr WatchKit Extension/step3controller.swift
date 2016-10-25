//
//  step1controller.swift
//  mamr
//
//  Created by Fabian Wetekamp on 25/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class step3controller: WKInterfaceController {
    let dish = Dinner(day: weekday.getweekday())
    var timerrunning:Bool = false
    
    
    @IBOutlet var cookingtimer: WKInterfaceTimer!
    
    @IBOutlet var startbutton: WKInterfaceButton!
    @IBAction func starttimer() { //basic timer function
        
        if (!timerrunning) {
            let date = Date(timeIntervalSinceNow: TimeInterval(dish.step3.time*60)) //configuring the cookingtimer
            cookingtimer.setDate(date)
            
            cookingtimer.start()
            startbutton.setTitle("Reset") //have to do a reset cause pause is not possible
            timerrunning = true
        }
        else {
            cookingtimer.stop()
            let date = Date(timeIntervalSinceNow: TimeInterval(dish.step3.time*60+1)) //configuring the cookingtimer
            cookingtimer.setDate(date)
            
            timerrunning = false
            startbutton.setTitle("Start")
        }
    }
    
    @IBOutlet var instructions: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        instructions.setText(dish.step3.step)
        startbutton.setHidden(!dish.step3.timerrequired)
        cookingtimer.setHidden(!dish.step3.timerrequired) //cookingtimer will be hidden if false flag is set on step object
        let date = Date(timeIntervalSinceNow: TimeInterval(dish.step3.time*60+1)) //configuring the cookingtimer
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
