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
    var people:Int = 0
    var dish = Dinner_Dish.init(people: 0, Day: weekday.getweekday()) //using dinner_dish to calculate ingredients amount

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        people = context as! Int
        print(people)
        loadTable() //initializing table
    }

    
    func loadTable() {

       dish = Dinner_Dish.init(people: people, Day: weekday.getweekday()) //using dinner_dish to calculate ingredients amount
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
  /*  override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "grocerieslist" {
            return(dish as Any?)
        }
        return dish
    }*/

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
