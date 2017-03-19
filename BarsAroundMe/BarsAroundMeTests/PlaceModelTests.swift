//
//  PlaceModelTests.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//
import XCTest
import Quick
import Nimble
import SwiftyJSON
@testable import BarsAroundMe

class PlaceModelsTests: QuickSpec {
    
    override func spec() {
        describe("on initialisation") {
            it("should populate the name property") {
                let data = self.placeData()
                let name:String = data["name"].stringValue
                let item = Place(withJSON: data)
                expect(item.name).to(equal(name))
            }
            it("should populate the id property") {
                let data = self.placeData()
                let id:String = data["id"].stringValue
                let item = Place(withJSON: data)
                expect(item.id).to(equal(id))
            }
            it("should populate the placeID property") {
                let data = self.placeData()
                let placeID:String = data["placeID"].stringValue
                let item = Place(withJSON: data)
                expect(item.placeID).to(equal(placeID))
            }
            it("should populate the latitude property") {
                let data = self.placeData()
                let latitude:Double = data["latitude"].doubleValue
                let item = Place(withJSON: data)
                expect(item.latitude).to(equal(latitude))
            }
            it("should populate the longitude property") {
                let data = self.placeData()
                let longitude:Double = data["longitude"].doubleValue
                let item = Place(withJSON: data)
                expect(item.longitude).to(equal(longitude))
            }
        }
    }
    
    private func placeData()->JSON{
        let json:JSON = ["name" : "Flying Fish Restaurant & Bar",
                                 "id" : "05bf6e9aa18b35f174f5076c348ce8e91e328aba",
                                 "placeID" : "ChIJm7Ex8UmuEmsR37p4Hm0D0VI",
                                 "latitude" : -33.8627642,
                                 "longitude" : 151.1951861
        ]
        return json
    }
    
}
