//
//  DinnerHome.swift
//  mamr
//
//  Created by Fabian Wetekamp on 26/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class DinnerHome: WKInterfaceController {

    @IBOutlet var dishname: WKInterfaceLabel!
    @IBOutlet var dishsubtitle: WKInterfaceLabel!
    @IBOutlet var dishimage: WKInterfaceImage!
    @IBOutlet var cookingtime: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let dish = Dinner.init(day: weekday.getweekday()) //setting dinner controller based on current menu
        dishname.setText(dish.dishtitle1)
        dishsubtitle.setText(dish.dishsubtitle1)
        dishimage.setImageNamed(dish.dishimagename1)
        cookingtime.setText(dish.dishcookingtime1)
        
        // Configure interface objects here.
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
