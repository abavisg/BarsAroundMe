//
//  CellViewModelSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class ListCellViewModelSpec: QuickSpec{
    
    override func spec() {
        
        var cellViewModel:ListCellViewModel?
        var place:Place?
        var userCoordinates:CLLocationCoordinate2D?
        beforeEach {
            
            place = MockData.place
            userCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        
        describe("when initialising") {
            context("with a place") {
                it("name string should be as configured") {
                    cellViewModel = ListCellViewModel(place, userCoordinates)
                    expect(cellViewModel.nameString).to(equal(place.name))
                }
                it("latitude string should be as configured") {
                    cellViewModel = ListCellViewModel(place, userCoordinates)
                    expect(cellViewModel.latitudeString).to(equal(place.latitude))
                }
                it("longitude string should be as configured") {
                    cellViewModel = ListCellViewModel(place, userCoordinates)
                    expect(cellViewModel.longitudeString).to(equal(place.longitude))
                }
                it("distanceString string should be as configured") {
                    cellViewModel = ListCellViewModel(place, userCoordinates)
                    expect(cellViewModel.longitudeString).to(equal(place.longitude))
                }
            }
        }
    }
}
