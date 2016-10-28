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
    var newuser:User = User(newuser: false)!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let newuser = getuserstatus(){
            print(newuser.newuser)
            pushController(withName: "home", context: "segue")
        }
        else {
            setuserstatus()
            print("user status set")
        }

        // Configure interface objects here.
    }


    @IBAction func getstarted() {
        newuser.newuser = false
        setuserstatus()
    }
    @IBAction func showlunch() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let notificationManager = NotificationsHandler()
        
        notificationManager.lunchnotificationcategories()
        
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Here's your menu for today."
        content.categoryIdentifier = "lunch_notification"
        content.subtitle = "Testing"
        content.sound = UNNotificationSound.default()
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        center.add(request) { (error: Error?) in
            print(error ?? "all good") //if error is catched, I might as well print it
            print("notification sent")
        }
    }
    @IBAction func TestLunch() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let notificationManager = NotificationsHandler()
        
        notificationManager.lunchnotificationcategories()
        
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Here's your menu for today."
        content.categoryIdentifier = "lunch_notification"
        content.subtitle = "Testing"
        content.sound = UNNotificationSound.default()
        

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        center.add(request) { (error: Error?) in
            print(error ?? "all good") //if error is catched, I might as well print it
        print("notification sent")
        }
    }
    
    @IBAction func showdinner() {
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
    
    func  getuserstatus() -> User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
    func setuserstatus(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(newuser, toFile: User.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save user status")
        }
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
