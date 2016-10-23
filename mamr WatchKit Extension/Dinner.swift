//
//  Dinner.swift
//  mamr
//
//  Created by Fabian Wetekamp on 23/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Dinner: NSObject {
    var weekday:Int
    var dayname: String = ""
    var dishtitle1: String = ""
    var dishcookingtime1: String = ""
    var dishsubtitle1: String = ""
    var dishimagename1: String = ""
    var dishtitle2: String = ""
    var dishcookingtime2: String = ""
    var dishsubtitle2: String = ""
    var dishimagename2: String = ""
    
    init(day: Int) //initialization function; sets required initialization values
    {
        weekday = day
        switch weekday {
        case 2:
            dayname = "Monday"
            dishtitle1 = "#1 Baked Seabass"
            dishsubtitle1 = "with Rocket Salad"
            dishcookingtime1 = "478kcal - 9.40€"
            dishimagename1 = "Lunch_Day1_Dish1"
            dishtitle2 = "#2 Roast Chicken"
            dishsubtitle2 = "with Rocket Salad"
            dishcookingtime2 = "Cooking Time: 25 Min"
            dishimagename2 = "Lunch_Day1_Dish2"
        default:
            dayname = "Today"
            dishtitle1 = "#1 Baked Seabass"
            dishsubtitle1 = "with Rocket Salad"
            dishcookingtime1 = "478kcal - 9.40€"
            dishimagename1 = "Lunch_Day1_Dish1"
            dishtitle2 = "#2 Roast Chicken"
            dishsubtitle2 = "with Rocket Salad"
            dishcookingtime2 = "Cooking Time: 15 Min"
            dishimagename2 = "Lunch_Day1_Dish2"
        }
    }

}
