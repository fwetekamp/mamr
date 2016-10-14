//
//  Notificationshandler.swift
//  mamr
//
//  Created by Fabian Wetekamp on 14/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import UserNotifications

class Notificationshandler: NSObject {
    
    
    func lunchnotificationcategories() { //declaring for actionable buttons for lunchnotifications
        
        let order1 = UNNotificationAction(identifier: "order1", title: "Order Dish #1", options: .foreground) //Button 1
        let order2 = UNNotificationAction(identifier: "order2", title: "Order Dish #2", options: .foreground) //Button 2
        
        let lunchcategory = UNNotificationCategory(identifier: "lunch_notification", actions: [order1, order2], intentIdentifiers: []) //setting the notification category for lunch
        
        UNUserNotificationCenter.current().setNotificationCategories([lunchcategory]) //setting actions & categories
    }
    
    func dinnernotificationcategories() { //declaring for actionable buttons for dinnernotifications
        
        let order1 = UNNotificationAction(identifier: "getrecipe1", title: "Get Recipe #1", options: .foreground) //Button 1
        let order2 = UNNotificationAction(identifier: "getrecipe2", title: "Get Recipe #2", options: .foreground) //Button 2
        
        let dinnercategory = UNNotificationCategory(identifier: "dinner_notification", actions: [order1, order2], intentIdentifiers: []) //setting the notification category for dinner
        
        UNUserNotificationCenter.current().setNotificationCategories([dinnercategory])  //setting actions & categories
    }
    
    
    func lunchnotificationhandler(){ //doesn't do anything, just for testing
        print("lunchnotificationhandler")
    }


}
