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
    
    var points = [Points]() //initializing balance array
    let center = UNUserNotificationCenter.current()

    
    @IBOutlet var balancelabelhome: WKInterfaceLabel!
    @IBAction func deletenotififcations() {
        center.removeAllPendingNotificationRequests()
    }
    
    override func willActivate() {
        super.willActivate()
    }
    override func handleAction(withIdentifier identifier: String?, for notification: UNNotification) {
        print("Tapped in notification") //handling action notifications
        print(identifier)
        switch(identifier){
        case "order1"?:
            print("tapped order1")
            pushController(withName: "Lunch_Start", context: "segue")
        case "order2"?:
            print("tapped order2")
            pushController(withName: "Lunch_Start", context: "segue")
        default: break
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let savedBalance = loadBalance(){  //loading point balance from NSCoder and printing it to main label
            points += savedBalance
            
        }
        else {
            initiliazebalance()
        }
        let lastbalancestring:Int = (points.last?.balance)!
        print(lastbalancestring)
        if lastbalancestring == 1 { // it has to be grammatically correct, right?
            balancelabelhome.setText("You earned \(lastbalancestring) point")
        }
        else {
            balancelabelhome.setText("You earned \(lastbalancestring) points")
        }
    }
    
    @IBAction func ScheduleLunch() {
        
        let notificationManager = NotificationsHandler()
        
        notificationManager.lunchnotificationcategories()
        
        
        let content = UNMutableNotificationContent() //creating the notification
        content.title = "Your Lunch"
        content.body = "Your Lunch"
        content.categoryIdentifier = "lunch_notification"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 00
        for i in 2..<7 { //scheduling for lunch notifications for weekdays
        dateComponents.weekday = i
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        print("notification scheduled \(dateComponents.weekday)")
        }
    }

    func  initiliazebalance(){ //points are saved, the last array element will be set to 0
        let user1 = Points(balance: 0)
        points += [user1!]
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    @IBAction func updatebalance() { //testing function to increment balance, remove later
        let lastbalance:Int = (points.last?.balance)!
        let newvalueint:Int = lastbalance + 1
        balancelabelhome.setText("You earned \(newvalueint) points")
        points.append(Points(balance: newvalueint)!)
        saveBalance()
    }
    
    @IBAction func reset() { //test function to setbalance to 0
        initiliazebalance()
        saveBalance()
        balancelabelhome.setText("You earned 0 points")
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
    

    /*//Starting heart rate code // heartrate code used at this stage
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
    
}
