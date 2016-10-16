//
//  PaymentInterfaceController.swift
//  mamr
//
//  Created by Fabian Wetekamp on 16/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation


class PaymentInterfaceController: WKInterfaceController {

    @IBAction func ApplePay() {
        confirmpayment()
    }
    @IBAction func CreditCard() {
        confirmpayment()

    }
    @IBAction func PayPal() {
        confirmpayment()
    }
    func confirmpayment() {
        testlabel.setText("test is working")
    }
    @IBOutlet var testlabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
