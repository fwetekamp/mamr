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

    //Lunch Outlets
    @IBOutlet var Lunch_headline: WKInterfaceLabel!
    @IBOutlet var notificationdish1: WKInterfaceLabel!
    @IBOutlet var dishimage1: WKInterfaceImage!
    @IBOutlet var title_dish1: WKInterfaceLabel!
    @IBOutlet var subtitle_dish1: WKInterfaceLabel!
    @IBOutlet var notificationdish2: WKInterfaceLabel!
    @IBOutlet var title_dish2: WKInterfaceLabel!
    @IBOutlet var subtitle_dish2: WKInterfaceLabel!
    @IBOutlet var dishimage2: WKInterfaceImage!
    @IBOutlet var notification_title: WKInterfaceLabel!
    
    //Dinner Outlets
    @IBOutlet var Dinner_headline: WKInterfaceLabel!
    @IBOutlet var D_day: WKInterfaceLabel!
    @IBOutlet var D_titledish1: WKInterfaceLabel!
    @IBOutlet var D_subtitledish1: WKInterfaceLabel!
    @IBOutlet var D_dishimage1: WKInterfaceImage!
    @IBOutlet var D_cookingtimedish1: WKInterfaceLabel!
    @IBOutlet var D_titledish2: WKInterfaceLabel!
    @IBOutlet var D_subtitledish2: WKInterfaceLabel!
    @IBOutlet var D_dishimage2: WKInterfaceImage!
    @IBOutlet var D_cookingtimedish2: WKInterfaceLabel!
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
        if notification.request.content.categoryIdentifier == "lunch_notification" { //branching by notification category
            let menu = Lunch.init(day: weekday.getweekday())
            self.notification_title.setText("Your lunch menu for")
            self.Lunch_headline.setText(menu.dayname)
            self.notificationdish1.setText(menu.dishtitle1)
            self.title_dish1.setText(menu.dishprice1)
            self.subtitle_dish1.setText(menu.dishsubtitle1)
            self.dishimage1.setImageNamed(menu.dishimagename1)
            self.notificationdish2.setText(menu.dishtitle2)
            self.title_dish2.setText(menu.dishprice2)
            self.subtitle_dish2.setText(menu.dishsubtitle2)
            self.dishimage2.setImageNamed(menu.dishimagename2)
        }
        else if notification.request.content.categoryIdentifier == "dinner_notification" {
            let menu = Dinner.init(day: weekday.getweekday())
            self.Dinner_headline.setText("Your dinner recipes for")
            self.D_day.setText(menu.dayname)
            self.D_titledish1.setText(menu.dishtitle1)
            self.D_subtitledish1.setText(menu.dishsubtitle1)
            self.D_dishimage1.setImageNamed(menu.dishimagename1)
            self.D_cookingtimedish1.setText(menu.dishcookingtime1)
        }
        completionHandler(.custom)
    }
}
    
    




