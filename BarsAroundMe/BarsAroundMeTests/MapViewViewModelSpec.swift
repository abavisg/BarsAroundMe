//
//  MapViewViewModelSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class MapViewViewModelSpec: QuickSpec{
    
    override func spec() {
        
        var dataProvider:PlacesAroundLocationDataProviderMock?
        var coordinates:CLLocationCoordinate2D?
        beforeEach {
            dataProvider = PlacesAroundLocationDataProviderMock()
            coordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        
        describe("when initialising") {
            context("with a data provider") {
                it("dataProvider should not be nil") {
                    let viewModel = MapViewViewModel(withDataProvider: dataProvider!)
                    expect(viewModel.dataProvider).toNot(beNil())
                }
            }
        }
        describe("when refreshing the dataProvider") {
            it("dataProvider should return 2 places") {
                let viewModel = MapViewViewModel(withDataProvider: dataProvider!)
                viewModel.refresh(withCoordinates: coordinates!)
                expect(viewModel.places.count).to(equal(2))
            }
            it("item at index 0 should have name as configures in mock data 2 places") {
                let viewModel = MapViewViewModel(withDataProvider: dataProvider!)
                viewModel.refresh(withCoordinates: coordinates!)
                let places = viewModel.places
                expect(places[0].name).to(equal("Flying Fish Restaurant & Bar"))
            }
            it("item at index 0 should have name as configures in mock data 2 places") {
                let viewModel = MapViewViewModel(withDataProvider: dataProvider!)
                viewModel.refresh(withCoordinates: coordinates!)
                let places = viewModel.places
                expect(places[1].name).to(equal("Pyrmont Bridge Hotel"))
            }
        }
        
    }
}

private class PlacesAroundLocationDataProviderMock: DataProvider {
    func fetchResults(forURL url: URL, _ completion: @escaping ([Any]?, NSError?) -> Void) {
        let places = MockData.placesAroundLocationResponseWithData.places
        completion(places, nil)
    }
}
