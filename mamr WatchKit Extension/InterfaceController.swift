//
//  InterfaceController.swift
//  mamr WatchKit Extension
//
//  Created by Fabian Wetekamp on 22/09/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications
import HealthKit


class InterfaceController: WKInterfaceController, UNUserNotificationCenterDelegate { //Extending class with delegate
    
    func notificationcategories() { //declaring notification categories for actionable notifications
        let center1 = UNUserNotificationCenter.current()
        center1.delegate = self
        
        let order1 = UNNotificationAction(identifier: "oder1", title: "Order Dish #1", options: .foreground) //Button 1
        let order2 = UNNotificationAction(identifier: "oder1", title: "Order Dish #2", options: .foreground) //Button 2
        
        let category = UNNotificationCategory(identifier: "lunch_notification", actions: [order1, order2], intentIdentifiers: []) //setting the notification category for lunch
        
        center1.setNotificationCategories([category])
    }
    
    
    @IBAction func lunch_notifications() { //lunch sample notification
        
        notificationcategories()

        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Your Lunch"
        content.categoryIdentifier = "lunch_notification"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) //trigger to the test the notification
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        print("notification delivered")
    }
    
//Starting heart rate code
    let calendar = NSCalendar.current

    
 
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let quantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate) else {
            print("not working")
            return
        }
        
        // Configure interface objects here.
    }
    let query = HKStatisticsCollectionQuery(quantityType: quantityType, quantitySamplePredicate: <#T##NSPredicate?#>, options: <#T##HKStatisticsOptions#>, anchorDate: Date, intervalComponents: DateComponents.init(hour: 2))
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
