//
//  ViewController.swift
//  testingpersistence2
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedUsers = loadUsers(){
            users += savedUsers
        }else{
            loadSampleUsers()
        }
        lastsaveduser.text = users.last?.name
    }
    
func  loadSampleUsers(){
        let user1 = User(balance = 3)!
        users += [user1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lastsaveduser: UILabel!
    @IBOutlet weak var enternewuser: UITextField!
    
    @IBAction func saveuser(_ sender: AnyObject) {
        let newvalue = enternewuser.text
        lastsaveduser.text = newvalue
        users.append(User(balance: newvalue!)!)
        saveUsers()
    }
    
    
    func saveUsers(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(users, toFile: User.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save users")
        }
    }
    
    func  loadUsers() -> [User]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? [User]
    }


}

