//
//  Lunch.swift
//  mamr
//
//  Created by Fabian Wetekamp on 14/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit

class Lunch: NSObject {
    var deliverytime: String = ""
    var deliveryaddress: String = ""
    
        init(time: String, address: String) //initialization function; sets required initialization values
        {
            deliverytime = time
            deliveryaddress = address
        }
    
    
  /*  var title:String
    var address:addrinfo
    var price:Int
    
    override init() //initialization function; sets required initialization values
    {

    }
*/
}
