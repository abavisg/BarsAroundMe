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
        
        var calloutViewViewModel:CalloutViewViewModel?
        let place = MockData.place
        
        beforeEach {
            calloutViewViewModel = CalloutViewViewModel()
            calloutViewViewModel?.update(with: place)
        }
        
        describe("when initialising") {
            context("with a place") {
                it("name string should be as configured") {
                    expect(calloutViewViewModel?.nameString).to(equal(place.name))
                }
                it("distanceString string should be as configured") {
                    let expectedResult = "1 km"
                    expect(calloutViewViewModel?.distanceString).to(equal(expectedResult))
                }
            }
        }
    }
}

