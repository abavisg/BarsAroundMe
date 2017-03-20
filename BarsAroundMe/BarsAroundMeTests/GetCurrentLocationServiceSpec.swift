//
//  GetCurrentLocationServiceSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class GetCurrentLocationServiceSpec: QuickSpec{
    
    override func spec() {
        
        let locationManagerMock = LocationManagerMock()
        let locationService = GetCurrentLocationService(with locationManagerMock)
        beforeEach {
        
        }
        
        describe("when initialising") {
            context("with a location manager") {
                it("location manager should not be nil") {
                    expect(locationService.locationManager).toNot(beNil())
                }
            }
        }
        describe("when requesting location") {
            context("with a location retrieved") {
                it("currentLocation should have a latitude and a longitude") {
                    let expectedLocation = CLLocation(latitude: 28.5388, longitude: -81.3756)
                    let currentLocation:CLLocationCoordinate2D?
                    locationService.completionHandler = {(coordinates, error) in
                        guard error == nil else{
                            return
                        }
                        if let coordinates = coordinates{
                            self.currentLocation = coordinates
                        }else{
                        }
                        
                    }
                    expect(self.currentLocation.latitude).to(equal(expectedLocation.latitude))
                    expect(self.currentLocation.longitude).to(equal(expectedLocation.longitude))

                }
            }
            context("with no available location") {
                it("currentLocation should be nil") {
                    let expectedLocation = CLLocation(latitude: 28.5388, longitude: -81.3756)
                    let currentLocation:CLLocationCoordinate2D?
                    locationService.completionHandler = {(coordinates, error) in
                        guard error == nil else{
                            return
                        }
                        if let coordinates = coordinates{
                            self.currentLocation = coordinates
                        }else{
                        }
                        
                    }
                    locationService.locationManagerMock.hasLocation = false
                    locationService.startUpdating
                    expect(self.currentLocation).to(beNil())
                }
            }
        }
        
    }
}

class LocationManagerMock:CLLocationManager{
    
    let kMockedLatitude = 28.5388;
    let kMockedLongitude = -81.3756;
    
    var hasLocation:Bool = true
    
    override func startUpdatingLocation() {
        guard hasLocation == true else{
            self.delegate?.locationManager!(self, didFailWithError: NSError(domain: "com.zerolabz.com", code: 100, userInfo: nil))
            return
        }
        let locations = [CLLocation(latitude: kMockedLatitude, longitude: kMockedLongitude)]
        self.delegate?.locationManager!(self, didUpdateLocations: locations)
    }
}

