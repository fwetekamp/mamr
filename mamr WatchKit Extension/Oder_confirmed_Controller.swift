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

    }
    
    func  initiliazebalance(){
        let user1 = Points(balance: 0)
        points = [user1!]
    }
    
    func updatebalance() {
        let lastbalance:Int = (points.last?.balance)!
        let newvalueint:Int = lastbalance + 1
        switch newvalueint {
        case 1: mamrpointslabel.setText("First point earned! Yay!")
        case 2: mamrpointslabel.setText("Second point, Congrats!")
        case 3: mamrpointslabel.setText("Third point earned! Stay health.")
        case 4: mamrpointslabel.setText("4 points, way to go!")
        case 5: mamrpointslabel.setText("Yes, 5 points earned.")
        case 6: mamrpointslabel.setText("Point 6, mamr is proud!")
        case 7: mamrpointslabel.setText("Lucky point number 7!")
        default: mamrpointslabel.setText("You have \(newvalueint) points.")
        }
        points.append(Points(balance: newvalueint)!)
        saveBalance() //saving balance
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
