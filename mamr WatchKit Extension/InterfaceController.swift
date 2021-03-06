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
    var newuser:User = User(newuser: false)!
    var points = [Points]() //initializing balance array
    var dateComponents_dinner_1 = DateComponents() //scheduling for 10:30 AM
    var dateComponents_dinner_2 = DateComponents() //schedling for 11:00 AM


    @IBOutlet var dinnerhome: WKInterfaceButton!
    
    @IBOutlet var balancelabelhome: WKInterfaceLabel!
    @IBAction func deletenotififcations() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
    
    @IBAction func checkdeliverednotifications() {
        let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications { delivered in
            print("Delivered Notifications: \(delivered)")
        }
    }
    @IBAction func checkpendingnotifications() {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { request in
            print("Requested Notifications: \(request)")
        })
        
    }
    func  getuserstatus() -> User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
    
    override func willActivate() {
        super.willActivate()
    }
    override func handleAction(withIdentifier identifier: String?, for notification: UNNotification) {
        print("Tapped in notification") //handling action notifications
        switch(identifier){
        case "order1"?:
            print("tapped order1")
            pushController(withName: "Lunch_Start", context: "segue")
        case "order2"?:
            print("tapped order2")
            pushController(withName: "Lunch_Start", context: "segue")
        case "getrecipe"?:
            print("tapped recipe")
            pushController(withName: "Dinner_Start", context: "segue")
        default: break
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if getuserstatus() == nil {
            print(newuser.newuser)
            pushController(withName: "onboarding", context: "segue")
        }
        
        dinnerhome.setHidden(true)
        dateComponents_dinner_1.hour = 17
        dateComponents_dinner_1.minute = 00 //setting the dinner notification schedule
        let date = NSDate()
        let calendar = NSCalendar.autoupdatingCurrent
        let datecomponents = calendar.dateComponents([.hour], from: date as Date) //getting the current hour
        let hour = datecomponents.hour

        if (hour! >= dateComponents_dinner_1.hour!) { //Dinnerhome will only be shown after the notification has been sent.
            dinnerhome.setHidden(false)
            print("Showing dinner menu on home")  
        }
        
        
        if let savedBalance = loadBalance(){  //loading point balance from NSCoder and printing it to main label
            points += savedBalance
            
        }
        else {
            initiliazebalance()
        }
        let lastbalancestring:Int = (points.last?.balance)!
        print(lastbalancestring)
        if lastbalancestring == 1 { // it has to be grammatically correct, right?
            balancelabelhome.setText("You earned \(lastbalancestring) point.")
        }
        else {
            balancelabelhome.setText("You earned \(lastbalancestring) points.")
        }
    }
    
    func schedulelunch(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Tap to see your lunch for today."
        content.categoryIdentifier = "lunch_notification"
        content.sound = UNNotificationSound.default()
        
        var dateComponents1 = DateComponents() //scheduling for 10:30 AM
        var dateComponents2 = DateComponents() //schedling for 11:00 AM
        
        for i in 2..<7 {  //scheduling for lunch notifications for weekdays
            dateComponents1.weekday = i
            dateComponents1.hour = 10
            dateComponents1.minute = 30
            dateComponents2.weekday = i
            dateComponents2.hour = 11
            dateComponents2.minute = 00
            let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents1, repeats: true)
            let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
            
            let request1 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)
            let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)
            center.add(request1) { (error: Error?) in
                print(error ?? "all good")
            }
            center.add(request2) { (error: Error?) in
                print(error ?? "all good")
            }
        }
    }
    func scheduledinner() {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Dinner"
        content.body = "Tap to see your dinner for today."
        content.categoryIdentifier = "dinner_notification"
        content.sound = UNNotificationSound.default()
        
        var dateComponents2 = DateComponents() //schedling for 11:00 AM
        
        for i in 2..<7 {  //scheduling for lunch notifications for weekdays
            dateComponents_dinner_1.weekday = i
            dateComponents2.weekday = i
            dateComponents2.hour = 17 //scheduling second dinner reminder
            dateComponents2.minute = 30
            //creating 2 triggers to scheudle lunch notifications
            let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents_dinner_1, repeats: true)
            let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
            
            let request1 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)
            let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)
            center.add(request1) { (error: Error?) in  //cathing errors with fancy swift 3 closures
                print(error ?? "all good")
            }
            center.add(request2) { (error: Error?) in
                print(error ?? "all good")
            }
        }
        presentAlert(withTitle: "Success!", message: "I will help you with recommendations to eat clean and healthy.", preferredStyle: WKAlertControllerStyle.alert, actions: [WKAlertAction.init(title: "Got it", style: WKAlertActionStyle.default, handler: {
        })])
        
        
        
    }
    
    @IBAction func activatenotifications() {
        let notificationManager = NotificationsHandler()
        notificationManager.notificationcategories()
      //  let center = UNUserNotificationCenter.current()
     //   center.removeAllPendingNotificationRequests()
        schedulelunch()
        scheduledinner()

        presentAlert(withTitle: "Success!", message: "I will help you with recommendations to eat clean and healthy.", preferredStyle: WKAlertControllerStyle.alert, actions: [WKAlertAction.init(title: "Got it", style: WKAlertActionStyle.default, handler: {
        })])
        
    }

    func  initiliazebalance(){ //points are saved, the last array element will be set to 0
        let user1 = Points(balance: 0)
        points += [user1!]
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func reset() { //setbalance to 0
        initiliazebalance()
        saveBalance()
        balancelabelhome.setText("You earned 0 points.")
        print("balance resetted")
    }

    func saveBalance(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(points, toFile: Points.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save balance")
        }
    }
    
    func  loadBalance() -> [Points]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Points.ArchiveURL.path) as? [Points]
    }
    
}
