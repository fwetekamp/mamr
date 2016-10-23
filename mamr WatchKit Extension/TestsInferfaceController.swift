//
//  TestsInferfaceControllerInterfaceController.swift
//  mamr
//
//  Created by Fabian Wetekamp on 16/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class TestsInferfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    @IBAction func TestLunch() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let notificationManager = NotificationsHandler()
        
        notificationManager.lunchnotificationcategories()
        
 /*       center.removeAllPendingNotificationRequests()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in //requesting authorization for notifications on first launch
            if granted {
                print("Got the auth!")
            } else {
                print("I need the auth to spam you")
            }
        }*/
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Here's your menu for today."
        content.categoryIdentifier = "lunch_notification"
        content.subtitle = "Testing"
        content.sound = UNNotificationSound.default()
        

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        center.add(request) { (error: Error?) in
            print(error)
        print("notification sent")
        }
    }
    
/*    func test(content: UNMutableNotificationContent) {

        }
    }*/
    @IBAction func TestDinner() { // dinner sample notification
        
        let notificationManager = NotificationsHandler()
        notificationManager.dinnernotificationcategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Dinner"
        content.body = "Here's your menu for today."
        content.categoryIdentifier = "dinner_notification"
        content.sound = UNNotificationSound.default()
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil) //generating random string with UUID() for dinner notification
        center.add(request) //adding notification to UNNotificationCenter
        print("notification sent")
        
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
