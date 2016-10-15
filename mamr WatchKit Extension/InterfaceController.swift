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


class InterfaceController: WKInterfaceController, UNUserNotificationCenterDelegate { //Extending class with notifications delegate
    

    var balance = 0
    
    @IBOutlet var balancelabel: WKInterfaceLabel!
    @IBAction func updatebalance() {
        var updatebalance = points(balance: balance)
        balance += 1
        balancelabel.setText(String(balance))
    }
    

    @IBAction func lunch_notifications() { //lunch sample notification
        
        let notificationManager = NotificationsHandler()
        
        notificationManager.lunchnotificationcategories()

        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Your Lunch"
        content.categoryIdentifier = "lunch_notification"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false) //trigger to the test the notification
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        print("notification sent")
    }
    
    @IBAction func dinner_notification() { //dinner sample notification
        
        let notificationManager = NotificationsHandler()
        notificationManager.dinnernotificationcategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Dinner"
        content.body = "Your Dinner"
        content.categoryIdentifier = "dinner_notification"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false) //trigger to the test the notification
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger) //generating random string with UUID() for dinner notification
        center.add(request) //adding notification to UNNotificationCenter
        print("notification sent")
    }
    
    var data = [points]()

    var filePath: String { //saving data
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first // using standard directory to sotring
        return url!.appendingPathComponent("Data").path
    }
    
    
    

    /*//Starting heart rate code
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
    
    */
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
