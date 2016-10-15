//
//  ViewController.swift
//  testingpersistence
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var balance = [Points]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedbalance = loadData() {
        balance += savedbalance
        }
        else {
            setbalance()
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setbalance(){
    balance.append(Points(balance: 0))
    }

    @IBOutlet weak var balancelabel: UILabel!
    @IBAction func Updatebalancelast(_ sender: AnyObject) {
        
        var lastbalance = balance.last?.Balance
        lastbalance = lastbalance! + 1

        let newbalance = Points(balance: lastbalance!)
        balance.append(newbalance)
        
       /* var points = balance.Balance
        print(points)
        points += 1
        let labelstring:String = String(points)
        balancelabel.text = labelstring

       balance = Points(balance: points)*/
        saveData()
    }

  /*  private func loadDataold() {
        
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Points {
            initialbalance = ourData
            print("Data loaded")
            print(ourData.Balance)
        }
    }*/
    
    private func saveData() {
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(balance, toFile: Points.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save")
        }
        else {
            print("saved")
        }
    }
    
    func  loadData() -> [Points]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Points.ArchiveURL.path) as? [Points]
    }
    
    



}

