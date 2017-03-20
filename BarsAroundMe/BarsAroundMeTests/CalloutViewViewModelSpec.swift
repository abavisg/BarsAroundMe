//
//  CalloutViewViewModelSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class CalloutViewViewModelSpec: QuickSpec{
    
    override func spec() {
        
        var cellViewModel:CalloutViewViewModel?
        var place:Place?
        var userCoordinates:CLLocationCoordinate2D?
        beforeEach {
            
            place = MockData.place
            userCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        
        describe("when initialising") {
            context("with a place") {
                it("name string should be as configured") {
                    cellViewModel = CalloutViewViewModel(with: place!, coordinates: userCoordinates!)
                    expect(cellViewModel?.nameString).to(equal(place?.name))
                }
                it("distanceString string should be as configured") {
                    let expectedResult = "1 km"
                    
                    cellViewModel = CalloutViewViewModel(with: place!, coordinates: userCoordinates!)
                    expect(cellViewModel?.distanceString).to(equal(expectedResult))
                }
            }
        }
    }
}

