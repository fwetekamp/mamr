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
    
    var users = [Points]()
    
    @IBOutlet var balancelabelhome: WKInterfaceLabel!
    
    override func willActivate() {
        super.willActivate()
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let savedBalance = loadBalance(){
            users += savedBalance
            
        }else{
            initiliazebalance()
        }
        let lastbalancestring:Int = (users.last?.balance)!
        print(lastbalancestring)
        balancelabelhome.setText(String(lastbalancestring))
    }
    
    func  initiliazebalance(){
        let user1 = Points(balance: 0)
        users = [user1!]
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    @IBAction func updatebalance() {
        let lastbalance:Int = (users.last?.balance)!
        let newvalueint:Int = lastbalance + 1
        balancelabelhome.setText(String(newvalueint))
        users.append(Points(balance: newvalueint)!)
        saveBalance()
    }
    


    
    func saveBalance(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(users, toFile: Points.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save balance")
        }
    }
    
    func  loadBalance() -> [Points]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Points.ArchiveURL.path) as? [Points]
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
    
}
