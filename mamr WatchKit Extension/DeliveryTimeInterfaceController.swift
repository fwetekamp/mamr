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
    let yourlunch = Lunch(time: "", address: "")

    var itemList: [(String, String)] = [
        ("Caption 1", "In 30 Minutes"),
        ("Caption 2", "In 45 Minutes"),
        ("Caption 3", "In 60 Minutes")]
    
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
        yourlunch.deliverytime = itemList[value].1
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

