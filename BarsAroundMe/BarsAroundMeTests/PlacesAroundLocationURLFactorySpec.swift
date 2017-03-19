//
//  PlacesAroundLocationURLFactorySpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//
import Quick
import Nimble
@testable import BarsAroundMe

class PlacesAroundLocationURLFactorySpec: QuickSpec {
    
    override func spec() {
        let expectedURL = URL(string: "https://maps.googleapis.com/maps/api/place/search/json?location=-33.8670522,151.1957362&radius=500&types=bar&key=AIzaSyBwofsXbxWZ2rci34Zs019VMy80fZgtCYI")
        
        let basePath = "https://maps.googleapis.com/maps/api/place/search/json"
        let parameters = ["location":"-33.8670522,151.1957362"] as [String : Any]
        
        let urlFactory = PlacesAroundLocationURLFactory(withBasePath: basePath, andParameters: parameters)
        
        describe("The url() method") {
            it("should return the expected url given the passed parameters") {
                expect(urlFactory.url()).to(equal(expectedURL))
            }
        }
    }
}

