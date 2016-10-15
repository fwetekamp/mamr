//
//  AddressInterfaceController.swift
//  mamr
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation



class AddressInterfaceController: WKInterfaceController, CLLocationManagerDelegate {

    @IBOutlet var mapObject: WKInterfaceMap!
    var locationManager: CLLocationManager = CLLocationManager()
    var mapLocation: CLLocationCoordinate2D?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations[0]
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        self.mapLocation = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(self.mapLocation!, span)
        self.mapObject.setRegion(region)
        self.mapObject.addAnnotation(self.mapLocation!, with: .red)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestLocation()

    }
    @IBAction func zoomslider(value: Float) {
        let degrees:CLLocationDegrees = CLLocationDegrees(value / 10)
        let span = MKCoordinateSpanMake(degrees, degrees)
        let region = MKCoordinateRegionMake(mapLocation!, span)
        mapObject.setRegion(region)
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
