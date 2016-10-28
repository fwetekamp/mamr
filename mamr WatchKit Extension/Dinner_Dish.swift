//
//  Dinner_Dish.swift
//  mamr
//
//  Created by Fabian Wetekamp on 24/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Dinner_Dish: Dinner { //extending dinner to customize recipes based on user input
    
    var numberofpeople: Int
    
    init (people: Int, Day: Int)
    {
        numberofpeople = people
        super.init(day: Day)
      //  let counter = ingredientsamount.count
        for (index, value) in ingredientsamount.enumerated() {
            ingredientsamount[index] = value * people
        }

    }
}
