//
//  mamrpoints.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class mamrpoints: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    
    var photo: UIImage?
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    // MARK: Initialisation
    
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty{
            return nil
        }
    }
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: PropertyKey.nameKey)
        aCoder.encode(self.photo, forKey: PropertyKey.photoKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        // Must call designated initializer.
        self.init(name: name, photo: photo)
    }
    
    
}
