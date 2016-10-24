//
//  Dinner.swift
//  mamr
//
//  Created by Fabian Wetekamp on 23/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Dinner: NSObject { //defining the dinner recipes
    var weekday:Int
    var dayname: String = ""
    var dishtitle1: String = ""
    var dishcookingtime1: String = ""
    var dishsubtitle1: String = ""
    var dishimagename1: String = ""
    var ingredients: [String] = []
    var ingredientsamount: [Int] = []
    var measuringunit: [String] = []
    
    init(day: Int) //initialization function; sets required initialization values
    {
        weekday = day
        switch weekday {
        case 2:
            dayname = "Monday"
            dishtitle1 = "Penne Arrabiata"
            dishsubtitle1 = "with Fried Eggplant"
            dishcookingtime1 = "20 Min"
            dishimagename1 = "Dinner_Day1_Dish1"
            ingredients = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
            ingredientsamount = [200, 150, 1, 50, 150, 10, 10]
            measuringunit = ["g", "g", "x", "g", "g", "g", "g"]
        case 3:
            dayname = "Tuesday"
            dishtitle1 = "Vietnamese Springrolls"
            dishsubtitle1 = "with Chicken & Mango"
            dishcookingtime1 = "25 Min"
            ingredients = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
            ingredientsamount = [200, 150, 1, 50, 150, 10, 10]
            measuringunit = ["g", "g", "x", "g", "g", "g", "g"]
            dishimagename1 = "Dinner_Day1_Dish1"
        default:
            dayname = "Today"
            dishtitle1 = "Penne Arrabiata"
            dishsubtitle1 = "with Fried Eggplant"
            dishcookingtime1 = "20 Min"
            dishimagename1 = "Dinner_Day1_Dish2"
        }
    }

}
