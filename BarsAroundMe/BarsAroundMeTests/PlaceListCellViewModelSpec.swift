//
//  PlaceListCellViewModelSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class PlaceListCellViewModelSpec: QuickSpec{
    
    override func spec() {
        
        var cellViewModel:PlaceListCellViewModel?
        var place:Place?
        var userCoordinates:CLLocationCoordinate2D?
        beforeEach {
            
            place = MockData.place
            userCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        
        describe("when initialising") {
            context("with a place") {
                it("name string should be as configured") {
                    cellViewModel = PlaceListCellViewModel(with: place!, coordinates: userCoordinates!)
                    expect(cellViewModel?.nameString).to(equal(place?.name))
                }
                it("distanceString string should be as configured") {
                    let placeLocation = CLLocation(latitude: (place?.latitude!)!, longitude: (place?.longitude!)!)
                    let userLocation = CLLocation(latitude: (userCoordinates?.latitude)!, longitude: (userCoordinates?.longitude)!)
                    let distance = userLocation.distance(from: placeLocation)
                    let expectedResult = "\(distance)"
                    cellViewModel = PlaceListCellViewModel(with: place!, coordinates: userCoordinates!)
                    expect(cellViewModel?.distanceString).to(equal(expectedResult))
                }
            }
        }
    }
}
