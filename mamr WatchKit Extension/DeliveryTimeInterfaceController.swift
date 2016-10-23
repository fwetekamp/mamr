//
//  DeliveryTimeInterfaceController.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class DeliveryTimeInterfaceController: WKInterfaceController {
//took me a gazilion hours to find out that you have to create a separate interface for controller in order to get the picker to work
    
    @IBOutlet var AddressPicker: WKInterfacePicker!

    var itemList: [(String, String)] = [
        ("Time 1", "11:00 - 11:30"),
        ("Time 2", "11:30 - 12:00"),
        ("Time 3", "12:00 - 12:30"),
        ("Time 4", "12:30 - 13:00"),
        ("Time 5", "13:00 - 13:30"),
        ("Time 6", "13:30 - 14:00")]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let pickerItems: [WKPickerItem] = itemList.map {
            
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        AddressPicker.setItems(pickerItems)
    }
    @IBAction func settime(_ value: Int) {

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

