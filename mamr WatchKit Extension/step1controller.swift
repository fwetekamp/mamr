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
    
    @IBOutlet var instructions: WKInterfaceLabel!
override func awake(withContext context: Any?) {
       let dish = Dinner(day: weekday.getweekday())
        instructions.setText(dish.step1)
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
