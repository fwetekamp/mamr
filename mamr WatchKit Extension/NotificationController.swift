//
//  NotificationController.swift
//  mamr WatchKit Extension
//
//  Created by Fabian Wetekamp on 11/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications
import UIKit


class NotificationController: WKUserNotificationInterfaceController {

    
    @IBOutlet var Lunch_headline: WKInterfaceLabel!
    @IBOutlet var notificationdish1: WKInterfaceLabel!
    @IBOutlet var test_image: WKInterfaceImage!
    @IBOutlet var title_dish1: WKInterfaceLabel!
    @IBOutlet var subtitle_dish1: WKInterfaceLabel!
    @IBOutlet var notificationdish2: WKInterfaceLabel!
    @IBOutlet var title_dish2: WKInterfaceLabel!
    @IBOutlet var subtitle_dish2: WKInterfaceLabel!
    @IBOutlet var test_image2: WKInterfaceImage!
    override init() {
        // Initialize variables here.
        super.init()
        
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


    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        let date = NSDate()
        let calendar = NSCalendar.autoupdatingCurrent
        let datecomponents = calendar.dateComponents([.weekday], from: date as Date) //getting the current weekday
        let weekday = datecomponents.weekday
        if notification.request.content.categoryIdentifier == "lunch_notification" { //branching by notification category
            let menu = Lunch.init(day: weekday!)
            self.Lunch_headline.setText(menu.dayname)
            self.notificationdish1.setText(menu.dishtitle1)
            self.title_dish1.setText(menu.dishprice1)
            self.subtitle_dish1.setText(menu.dishsubtitle1)
            self.test_image.setImageNamed(menu.dishimagename1)
            self.notificationdish2.setText(menu.dishtitle2)
            self.title_dish2.setText(menu.dishprice2)
            self.subtitle_dish2.setText(menu.dishsubtitle2)
            self.test_image2.setImageNamed(menu.dishimagename2)
        completionHandler(.custom)
        }
    }
    
    

}


