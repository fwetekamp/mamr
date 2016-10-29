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
    var timerrequired: Bool = false
    var time = Int()
    var step1:cookingstep = cookingstep(cookingstep: "", timer: false)
    var step2:cookingstep = cookingstep(cookingstep: "", timer: false)
    var step3:cookingstep = cookingstep(cookingstep: "", timer: false)

    
    init(day: Int)
    {
        weekday = day
        switch weekday {
        case 2:
            dayname = "Monday"
            dishtitle1 = "Vietnamese Springrolls"
            dishsubtitle1 = "with Hoisin Sauce"
            dishcookingtime1 = "Cooking Time: 15 Min"
            dishimagename1 = "Dinner_Day1_Dish1"
            ingredients = ["Rice Vermicelli", "Rice Wrappers", "Halved Shrimp", "Thai Basil", "Mint Leaves", "Cilantro", "Chopped Lettuce", "Fish Sauce", "Lime Juice", "Minced Garlic", "Sugar", "Chili Sauce", "Hoisin Sauce"]
            ingredientsamount = [50,  4,  4, 20,  20, 20, 1,  20,  15, 1, 10,    5, 20, 30]
            measuringunit =     ["g","x","x","g","g", "g", "x", "ml", "ml", "x", "g", "g", "ml", "ml"]
            step1 = cookingstep(cookingstep: "Boil vermicelli 4 min & drain Dip wrapper in warm water (1 sec) to soften. Place shrimp, vermicelli, basil, mint, cilantro & lettuce in wrapper. Fold sides inward, tightly roll the wrapper. Repeat.",timer: true, steptime: 4)
            step2 = cookingstep(cookingstep: "In a small bowl, mix fish sauce, water, lime juice, garlic, sugar and chili sauce. In another small bowl, mix the hoisin sauce and peanuts.",timer: false)
            step3 = cookingstep(cookingstep: "Serve rolled spring rolls with the fish sauce and hoisin sauce mixtures.",timer:false)
            
        case 3:
            dayname = "Tuesday"
            dishtitle1 = "Spinach Salad"
            dishsubtitle1 = "with Goat Cheese"
            dishcookingtime1 = "Cooking Time: 10 Min"
            dishimagename1 = "Dinner_Day2_Dish1"
            ingredients = ["Red Wine Vinegar", "Minced Shallot", "Dijon Mustard", "Salt", "Black Pepper", "Walnut Oil", "Baby Spinach", "Chopped Walnuts", "Goat Cheese"]
            ingredientsamount = [10, 20, 20,  10,   10, 20,  150,  30, 30]
            measuringunit = ["ml", "g", "ml", "g", "g", "ml", "g", "g", "g"]
            step1 = cookingstep(cookingstep: "In a small bowl, combine the vinegar, shallot, mustard, salt, and pepper. Gradually whisk in the oil to make a creamy dressing.",timer: false)
            step2 = cookingstep(cookingstep: "Put all but a large handful of the spinach in a large bowl. Toss with most of the dressing.",timer: false)
            step3 = cookingstep(cookingstep: "Add remaining spinach and continue tossing until well coated. Serve immediately topped with goat cheese and walnuts.",timer:false)
            
        case 4:
            dayname = "Wednesday"
            dishtitle1 = "Mushroom Risotto"
            dishsubtitle1 = "with Zucchini"
            dishcookingtime1 = "Cooking Time: 40 Min"
            ingredients = ["Onion", "Zucchini", "Risotto Rice", "Vegetarian Broth", "Minced Garlic", "Mushrooms", "Pramesan", "White Whine"]
            ingredientsamount = [50, 1, 150, 100, 1, 150, 50, 50]
            measuringunit = ["g", "x", "g", "ml", "x", "g", "g", "ml"]
            dishimagename1 = "Dinner_Day3_Dish1"
            step1 = cookingstep(cookingstep: "Heat up zucchini, onions, garlic, mushrooms in large pan with olive oil for 4 min. Season with salt & pepper.",timer: true, steptime: 4)
            step2 = cookingstep(cookingstep: "Add risotto rice and stir until rice soaks up liquid. Ad whine, after 1 min, add 1 cup of broth, stir.",timer: false)
            step3 = cookingstep(cookingstep: "Contionously stir until rice soaks up liquids, add 1 cup of broth, stir again, for 20min in total. Add parmesan on the end.", timer:true, steptime: 20)
            
        case 5:
            dayname = "Thursday"
            dishtitle1 = "Beef Taco"
            dishsubtitle1 = "with Vegetables"
            dishcookingtime1 = "Cooking Time: 20 Min"
            ingredients = ["Ground Beef", "Onion", "Chili", "Salt", "Garlic Powder", "Tomato Sauce", "Taco Shells", "Cheddar Cheese", "Lettuce", "Tomatos", "Salsa"]
            ingredientsamount = [150,  50, 5,  5, 3, 200, 3, 100, 1, 1, 50]
            measuringunit =     ["g", "g","g","g", "g", "ml", "x", "g", "x", "x", "ml"]
            dishimagename1 = "Dinner_Day4_Dish1"
            step1 = cookingstep(cookingstep: "Heat oven to 120°C. In medium skillet, brown ground beef and onion over medium heat for 8 min or until beef is thoroughly cooked, stirring frequently. Drain.",timer: true, steptime: 8)
            step2 = cookingstep(cookingstep: "Stir in chili powder, salt, garlic powder and tomato sauce. Reduce heat to low; cover and simmer 10 minutes. Meanwhile, place taco shells on ungreased cookie sheet. Heat at 120°C for 5 minutes.",timer: true, steptime: 10)
            step3 = cookingstep(cookingstep: "To assemble tacos, layer beef mixture, cheese, lettuce and tomatoes in each taco shell. Serve with salsa.", timer:false)
            
        case 6:
            dayname = "Friday"
            dishtitle1 = "Penne Arrabiata"
            dishsubtitle1 = "with Parmesan"
            dishcookingtime1 = "Cooking Time: 20 Min"
            ingredients = ["Oliveoil", "Salt", "Penne", "Tomatoe Paste", "Chili Flakes", "Tomatoe", "Parmigiano"]
            ingredientsamount = [25, 5, 150, 150, 5, 1, 15]
            measuringunit = ["ml", "g", "g", "ml", "g", "x", "g"]
            dishimagename1 = "Dinner_Day5_Dish1"
            step1 = cookingstep(cookingstep: "Start boiling 3L of salt water. Put olive oil in a pan (mid heat), add tomato paste & pepper flakes; reduce heat to low & stir until fragrant for 4 min. Stir in tomatoes & remove from heat.",timer: true, steptime: 4)
            step2 = cookingstep(cookingstep: "Drop the pasta into the boiling water, and cook until al dente. Drain the pasta, reserving 1/4 cup of the pasta water.",timer: true, steptime: 8)
            step3 = cookingstep(cookingstep: "Add pasta and reserved pasta water to tomato sauce, stir and toss over medium heat until the pasta is well coated. Season with salt & oliver oil. Serve with Parmigiano.",timer:false)
            
        default:
            dayname = "Today"
            dishtitle1 = "Spinach Salad"
            dishsubtitle1 = "with Goat Cheese"
            dishcookingtime1 = "Cooking Time: 10 Min"
            dishimagename1 = "Dinner_Day2_Dish1"
            ingredients = ["Red Wine Vinegar", "Minced Shallot", "Dijon Mustard", "Salt", "Black Pepper", "Walnut Oil", "Baby Spinach", "Chopped Walnuts", "Goat Cheese"]
            ingredientsamount = [10, 20, 20,  10,   10, 20,  150,  30, 30]
            measuringunit = ["ml", "g", "ml", "g", "g", "ml", "g", "g", "g"]
            step1 = cookingstep(cookingstep: "In a small bowl, combine the vinegar, shallot, mustard, salt, and pepper. Gradually whisk in the oil to make a creamy dressing.",timer: false)
            step2 = cookingstep(cookingstep: "Put all but a large handful of the spinach in a large bowl. Toss with most of the dressing.",timer: false)
            step3 = cookingstep(cookingstep: "Add remaining spinach and continue tossing until well coated. Serve immediately topped with goat cheese and walnuts.",timer:false)
        }
    }

}
