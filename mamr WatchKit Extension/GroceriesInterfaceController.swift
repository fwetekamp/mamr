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

    
    @IBOutlet var table: WKInterfaceTable!

    let ingredientsname = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
    let ingredientsamount = ["200g", "150g", "1", "50g", "150g", "10g", "10g"]
    
    func loadTable() {
        table.setRowTypes(["groceries"])

        table.setNumberOfRows(ingredientsname.count,
                                withRowType: "groceries")
        for (index, grocery) in ingredientsname.enumerated() {
            let row = table.rowController(at: index) as! RowController
            row.grocerytype.setText(grocery)
            row.groceryamount.setText(ingredientsamount[index])
        }
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTable()
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
