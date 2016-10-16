//
//  Oder_confirmed_Controller.swift
//  mamr
//
//  Created by Fabian Wetekamp on 16/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class Oder_confirmed_Controller: WKInterfaceController {
    
    var points = [Points]()

    @IBOutlet var logo: WKInterfaceImage!
    @IBOutlet var mamrpointslabel: WKInterfaceLabel!
    
    override func willActivate() {
        super.willActivate()
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        logo.setImageNamed("Logo")
        logo.sizeToFitHeight()
        if let savedBalance = loadBalance(){
            points += savedBalance
            
        }
        else
        {
            initiliazebalance()
        }
        updatebalance()

       /* let lastbalancestring:Int = (points.last?.balance)!
        print(lastbalancestring)
        if Int(lastbalancestring) == 1 {
        mamrpointslabel.setText("You earned your first point! Yay!")
        }
        else {
        mamrpointslabel.setText("You now have \(lastbalancestring) mamrpoints")
        }    code not used*/
    }
    
    func  initiliazebalance(){
        let user1 = Points(balance: 0)
        points = [user1!]
    }
    
    func updatebalance() {
        let lastbalance:Int = (points.last?.balance)!
        let newvalueint:Int = lastbalance + 1
        if Int(newvalueint) == 1 {
            mamrpointslabel.setText("First point earned! Yay!")
        }
        else {
            mamrpointslabel.setText("You earned \(newvalueint) mamrpoints")}
        points.append(Points(balance: newvalueint)!)
        saveBalance()
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


    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
