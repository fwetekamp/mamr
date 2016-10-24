//
//  peoplepickerInterfacecontroller.swift
//  mamr
//
//  Created by Fabian Wetekamp on 24/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class peoplepickerInterfacecontroller: WKInterfaceController {
    
    @IBOutlet var peoplepicker: WKInterfacePicker!
    var people:Int = 0
    
    @IBAction func setpeople(_ value: Int) {
        people = value
    }
    var ingredientsname:[String] = []
    var ingredientsamount:[Int] = []
    var measuringunit:[String] = []
    
    var itemList: [(String, String)] = [
        ("1", "1"),
        ("2", "2"),
        ("3", "3"),
        ("4", "4"),
        ("5", "5"),
        ("6", "6")]

    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "grocerieslist" {
            return(people as Any?)
        }
        return people
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let pickerItems: [WKPickerItem] = itemList.map { //defining the picker
            
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        peoplepicker.setItems(pickerItems)
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
