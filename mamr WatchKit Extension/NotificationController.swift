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
        
        
        if notification.request.content.title == "Your Lunch" { //
            notificationdish1.setText("#1 - Grilled Salmon")
            title_dish1.setText("478kcal - 9.40€")
            subtitle_dish1.setText("with rocket & mashed potatoes")
            notificationdish2.setText("#2 - Roast Chicken")
            subtitle_dish2.setText("with mushroom sauce")

            title_dish2.setText("583kcal - 8.30€")

            test_image.setImageNamed("Lunch_Day1_Dish1")
            test_image2.setImageNamed("Lunch_Day1_Dish2")
        }
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.custom)
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


