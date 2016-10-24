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


    var ingredientsname:[String] = []
    var ingredientsamount:[Int] = []
    var measuringunit:[String] = []

    
    func loadTable() {
        let date = NSDate()
        let calendar = NSCalendar.autoupdatingCurrent
        let datecomponents = calendar.dateComponents([.weekday], from: date as Date) //getting the current weekday
        let weekday = datecomponents.weekday
        let dish = Dinner_Dish.init(people: 3, Day: weekday!) //using dinner_dish to calculate ingredients amount
        ingredientsname = dish.ingredients
        print(dish.ingredients)
        ingredientsamount = dish.ingredientsamount
        measuringunit = dish.measuringunit

        
        table.setRowTypes(["groceries"])

        table.setNumberOfRows(ingredientsname.count, //setting up the table
                                withRowType: "groceries")
        for (index, grocery) in ingredientsname.enumerated() {
            let row = table.rowController(at: index) as! RowController
            row.grocerytype.setText(grocery)
            row.groceryamount.setText(String(ingredientsamount[index]))
            row.unit.setText(measuringunit[index])
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
