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

        switch weekday {
        case 2?:                                                            //monday
            self.Lunch_headline.setText("Monday")
            self.notificationdish1.setText("#1 Baked Seabass")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with Rocket Salad")
            self.notificationdish2.setText("#2 Roast Chicken")
            self.subtitle_dish2.setText("with Mushroom Sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        case 3?:                                                            //tuesday
            self.Lunch_headline.setText("Tuesday")
            self.notificationdish1.setText("#1 Teriyaki Chicken")
            self.title_dish1.setText("478kcal - 9.00€")
            self.subtitle_dish1.setText("with Fried Rice")
            self.notificationdish2.setText("#2 Avocado Salad")
            self.title_dish2.setText("478kcal - 8.00€")
            self.subtitle_dish2.setText("with Grilled Sweet Potatoe")
            self.test_image.setImageNamed("Lunch_Day2_Dish2")
            self.test_image2.setImageNamed("Lunch_Day2_Dish1")
        case 4?:                                                            //wedneday
            self.Lunch_headline.setText("Wednesday")
            self.notificationdish1.setText("#1 Almond Salmon")
            self.title_dish1.setText("448kcal - 9.60€")
            self.subtitle_dish1.setText("with Orange Blur Blanc")
            self.notificationdish2.setText("#2 - Grilled Chicken")
            self.subtitle_dish2.setText("with Toasted Barley")
            self.title_dish2.setText("535kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day3_Dish1")
            self.test_image2.setImageNamed("Lunch_Day3_Dish2")
        case 5?:                                                            //thursday
            self.Lunch_headline.setText("Thursday")
            self.notificationdish1.setText("#1 Pesto Pasta")
            self.title_dish1.setText("578kcal - 8.00€")
            self.subtitle_dish1.setText("with Chicken Fillet")
            self.notificationdish2.setText("#2 Grilled Perch Fillet")
            self.subtitle_dish2.setText(" with Apricot & Herb Barley")
            self.title_dish2.setText("461kcal - 9.80€")
            self.test_image.setImageNamed("Lunch_Day4_Dish1")
            self.test_image2.setImageNamed("Lunch_Day4_Dish2")
        case 6?:                                                            //friday
            self.Lunch_headline.setText("Friday")
            self.notificationdish1.setText("#1 Grilled Beef")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with Soba Noodles")
            self.notificationdish2.setText("#2 Teriyaki Salmon")
            self.subtitle_dish2.setText("with Bok Choy & Rice")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day5_Dish1")
            self.test_image2.setImageNamed("Lunch_Day5_Dish2")
        default:
            self.notificationdish1.setText("#1 - Baked Seabass")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
            }
        completionHandler(.custom)
    
        }
    }
    
    

}


