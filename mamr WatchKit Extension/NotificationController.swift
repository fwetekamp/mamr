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
            self.notificationdish1.setText("#1 - Monday test dish Salmon")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        case 3?:                                                            //tuesday
            self.notificationdish1.setText("#1 - Tuesday test dish")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        case 4?:                                                            //wedneday
            self.notificationdish1.setText("#1 - Wednesday test dish")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        case 5?:                                                            //thursday
            self.notificationdish1.setText("#1 - Thursday test dish")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        case 6?:                                                            //friday
            self.notificationdish1.setText("#1 - Friday test dish")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
        default:
            self.notificationdish1.setText("#1 - General test dish")
            self.title_dish1.setText("478kcal - 9.40€")
            self.subtitle_dish1.setText("with rocket & mashed potatoes")
            self.notificationdish2.setText("#2 - Roast Chicken")
            self.subtitle_dish2.setText("with mushroom sauce")
            self.title_dish2.setText("583kcal - 8.30€")
            self.test_image.setImageNamed("Lunch_Day1_Dish1")
            self.test_image2.setImageNamed("Lunch_Day1_Dish2")
            }
            
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.custom)
    
        }
    }
    
    

    
  /*  switch(response.actionIdentifier){
    case "order1":
        print("tapped order1")
    case "order2":
        print("tapped order2")
    default: break
    }*/

    
    
    
       /* let actionIdentifier = response.actionIdentifier
        if actionIdentifier == "com.apple.UNNotificationDefaultActionIdentifier" || actionIdentifier == "com.apple.UNNotificationDismissActionIdentifier" {
            return;
        }
        let dish1 = (actionIdentifier == "order1")
        let dish2 = (actionIdentifier == "order2")
    
        repeat {
            if (dish1) {
                (print("order 1 pressed"))
               break;
            }
            if (dish2) {
                (print("order 2 pressed"))
                break;
            }
        } while (false);
       */ // Must be called when finished

    
    /*optional func didReceive(_ response: UNNotificationResponse,
                             completionHandler completion: @escaping () -> Void)
    {
        
        if response.actionIdentifier == "tomorrowReminder" {
            print("Tomrrow Button Pressed")
            subLabel.text = "Reminder For Tomorrow"
            subLabel.textColor = UIColor.blue
            done(.dismissAndForwardAction)
        }
        
        if response.actionIdentifier == "dismissReminder" {
            print("Dismiss Button Pressed")
            done(.dismiss)
            
        } else {
            print("Else response")
            done(.dismissAndForwardAction)
        }
        
    }*/

}


