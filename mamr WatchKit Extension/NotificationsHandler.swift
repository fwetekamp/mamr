//
//  Notificationshandler.swift
//  mamr
//
//  Created by Fabian Wetekamp on 14/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import UserNotifications

class NotificationsHandler: NSObject {
    
    
    func notificationcategories() { //declaring for actionable buttons for lunchnotifications
        
        let order1 = UNNotificationAction(identifier: "order1", title: "Order Dish #1", options: .foreground) //Button 1
        let order2 = UNNotificationAction(identifier: "order2", title: "Order Dish #2", options: .foreground) //Button 2
        let getrecipe = UNNotificationAction(identifier: "getrecipe", title: "Get Recipe", options: .foreground) //Button 1
        let dinnercategory = UNNotificationCategory(identifier: "dinner_notification", actions: [getrecipe], intentIdentifiers: []) //setting the notification category for dinner
        
        let lunchcategory = UNNotificationCategory(identifier: "lunch_notification", actions: [order1, order2], intentIdentifiers: []) //setting the notification category for lunch
        
        UNUserNotificationCenter.current().setNotificationCategories([lunchcategory, dinnercategory]) //setting actions & categories
    }

}
