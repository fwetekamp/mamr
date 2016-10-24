//
//  Lunch.swift
//  mamr
//
//  Created by Fabian Wetekamp on 14/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Lunch: NSObject { //class to initiate declare the luch object
    var weekday:Int
    var dayname: String = ""
    var dishtitle1: String = ""
    var dishprice1: String = ""
    var dishsubtitle1: String = ""
    var dishimagename1: String = ""
    var dishtitle2: String = ""
    var dishprice2: String = ""
    var dishsubtitle2: String = ""
    var dishimagename2: String = ""
    
        init(day: Int) //Setting lunch menu depending on weekday
        {
            weekday = day
            switch weekday {
                
            case 2:
                dayname = "Monday"
                dishtitle1 = "#1 Baked Seabass"
                dishsubtitle1 = "with Rocket Salad"
                dishprice1 = "478kcal - 9.40€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 Roast Chicken"
                dishsubtitle2 = "with Rocket Salad"
                dishprice2 = "583kcal - 8.30€"
                dishimagename2 = "Lunch_Day1_Dish2"
                
            case 3:
                dayname = "Tuesday"
                dishtitle1 = "#1 Teriyaki Chicken"
                dishsubtitle1 = "with Fried Rice"
                dishprice1 = "478kcal - 9.00€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 Avocado Salad"
                dishsubtitle2 = "with Grilled Sweet Potatoe"
                dishprice2 = "435kcal - 8.00€"
                dishimagename2 = "Lunch_Day1_Dish2"
                
            case 4:
                dayname = "Wednesday"
                dishtitle1 = "#1 Almond Salmon"
                dishsubtitle1 = "with Orange Blur Blanc"
                dishprice1 = "448kcal - 9.60€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 - Grilled Chicken"
                dishsubtitle2 = "with Toasted Barley"
                dishprice2 = "535kcal - 8.30€"
                dishimagename2 = "Lunch_Day1_Dish2"
                
            case 5:
                dayname = "Thursday"
                dishtitle1 = "#1 Pesto Pasta"
                dishsubtitle1 = "with Chicken Filet"
                dishprice1 = "578kcal - 8.00€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 Grilled Perch Fillet"
                dishsubtitle2 = "with Apricot & Herb Barley"
                dishprice2 = "461kcal - 9.80€"
                dishimagename2 = "Lunch_Day1_Dish2"
                
            case 6:
                dayname = "Friday"
                dishtitle1 = "#1 Grilled Beef"
                dishsubtitle1 = "with Rocket Salad"
                dishprice1 = "518kcal - 9.40€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 Teriyaki Salmon"
                dishsubtitle2 = "with Bok Choy & Rice"
                dishprice2 = "494kcal - 8.30€"
                dishimagename2 = "Lunch_Day1_Dish2"
                
            default:
                dayname = "Today"
                dishtitle1 = "#1 Baked Seabass"
                dishsubtitle1 = "with Rocket Salad"
                dishprice1 = "478kcal - 9.40€"
                dishimagename1 = "Lunch_Day1_Dish1"
                dishtitle2 = "#2 Roast Chicken"
                dishsubtitle2 = "with Rocket Salad"
                dishprice2 = "584kcal - 8.30€"
                dishimagename2 = "Lunch_Day1_Dish2"
        }
    }
}
