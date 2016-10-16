//
//  GroceriesInterfaceController.swift
//  mamr
//
//  Created by Fabian Wetekamp on 16/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class GroceriesInterfaceController: WKInterfaceController {

    @IBOutlet var Grociery_Table: WKInterfaceGroup!
    
    @IBOutlet var grocieryname: WKInterfaceLabel!
    @IBOutlet var grocerysamount: WKInterfaceLabel!
    let ingredientsname = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
    let ingredientsamount = ["200g", "150g", "1", "50g", "150g", "", "Pepper"]*/
    
    func loadTable() {
        myTable.setNumberOfRows(stringData.count,
                                                     withRowType: "MyRowController")
         
            for (index, labelText) in stringData.enumerate() {
                    let row = myTable.rowControllerAtIndex(index)
                              as! MyRowController
                    row.myLabel.setText(labelText)
                    row.myImage.setImage(UIImage(named: imageData[index]))
                }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
