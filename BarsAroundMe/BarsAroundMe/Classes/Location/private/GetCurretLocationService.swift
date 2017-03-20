//
//  GetCurretLocationService.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit
import CoreLocation

class GetCurrentLocationService: NSObject, CLLocationManagerDelegate{
    
    var completionHandler: (CLLocationCoordinate2D?, Error?)->Void = {_,_ in }
    
    var locationManager:CLLocationManager!
    
    init(with locationManager:CLLocationManager) {
        super.init()
        self.locationManager = locationManager
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    //MARK - LocationService protocol methods
    
    func requestCurrentLocation(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        self.completionHandler(userLocation.coordinate, nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
        self.completionHandler(nil, error)
    }
}
