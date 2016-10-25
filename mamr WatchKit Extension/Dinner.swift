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
    var dayname = String()
    var dishtitle1 = String()
    var dishcookingtime1 = String()
    var dishsubtitle1 = String()
    var dishimagename1 = String()
    var ingredients: [String] = []
    var ingredientsamount: [Int] = []
    var measuringunit: [String] = []
  //  var step1 = String()
 //   var step2 = String()
  //  var step3 = String()
    var timerrequired: Bool = false
    var time = Int()
    var step1:cookingstep = cookingstep(cookingstep: "", timer: false)
    var step2:cookingstep = cookingstep(cookingstep: "", timer: false)
    var step3:cookingstep = cookingstep(cookingstep: "", timer: false)

    
    init(day: Int) //initialization function; sets required initialization values
    {
        weekday = day
        switch weekday {
        case 2:
            dayname = "Monday"
            dishtitle1 = "Penne Arrabiata"
            dishsubtitle1 = "with Fried Eggplant"
            dishcookingtime1 = "Cooking Time: 20 Min"
            dishimagename1 = "Dinner_Day1_Dish1"
            ingredients = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
            ingredientsamount = [200, 150, 1, 50, 150, 10, 10]
            measuringunit = ["g", "g", "x", "g", "g", "g", "g"]
            
            
            
          /*  step1 = "Heat up of olive oil in a large skillet over medium heat. Add the garlic, and saute for a few minutes. Sprinkle in the red pepper flakes, and saute for another minute. Pour in the diced tomatoes and tomato sauce, and add the basil. Simmer for about 20 minutes, stirring occasionally."
            step2 = "Meanwhile, bring a large pot of lightly salted water to a boil. Add penne pasta, and cook for 8 minutes, or until tender. Drain."
            step3 = "Heat remaining olive oil in a large skillet over medium heat. Fry chicken for about 5 minutes per side, or until the coating is a nice dark brown color. Mix everything and enjoy."
            */
        case 3:
            dayname = "Tuesday"
            dishtitle1 = "Vietnamese Springrolls"
            dishsubtitle1 = "with Chicken & Mango"
            dishcookingtime1 = "Cooking Time: 20 Min"
            ingredients = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
            ingredientsamount = [200, 150, 1, 50, 150, 10, 10]
            measuringunit = ["g", "g", "x", "g", "g", "g", "g"]
            dishimagename1 = "Dinner_Day2_Dish1"
            step1 = cookingstep(cookingstep: "Do this and do that.",timer: true, steptime: 10)
            step2 = cookingstep(cookingstep: "Do this and do that.",timer: false)
            step3 = cookingstep(cookingstep: "Do this and do that.",timer:false)
            
        case 4:
            dayname = "Wednesday"
            dishtitle1 = "Spaghetti Carbonara"
            dishsubtitle1 = "with Zucchini"
            dishcookingtime1 = "15 Min"
            ingredients = ["Pasta", "Bacon", "Zucchini", "Parmesan", "Mushrooms", "Salt", "Pepper"]
            ingredientsamount = [200, 150, 1, 50, 150, 10, 10]
            measuringunit = ["g", "g", "x", "g", "g", "g", "g"]
            dishimagename1 = "Dinner_Day2_Dish1"

        default:
            dayname = "Today"
            dishtitle1 = "Penne Arrabiata"
            dishsubtitle1 = "with Fried Eggplant"
            dishcookingtime1 = "20 Min"
            dishimagename1 = "Dinner_Day1_Dish2"
        }
    }

}
