//
//  PlacesAroundLocationDataProviderSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//
import Quick
import Nimble
import Mockingjay

@testable import BarsAroundMe

class PlaceAroundLocationDataProviderSpec : QuickSpec{
    
    override func spec() {
        
        var dataProvider: PlaceAroundLocationDataProvider!
        
        var urlFactory:URLFactory?
        
        beforeEach {
            urlFactory = PlacesAroundLocationURLFactoryMock(withBasePath: "", andParameters: [String:Any]())
            dataProvider = PlaceAroundLocationDataProvider()
        }
        
        describe("when fetchResults") {
            context("with a valid response of 2 items") {
                it("should return the expected result") {
                    let expectedResult = MockData.placesAroundLocationResponseWithData.places
                    self.stub(uri("https://mock-url.com/service"), json(MockData.placesAroundLocationResponseWithData.responseData))
                    var places = [Place]()

                    dataProvider.fetchResults(forURL: (urlFactory?.url())!, { (  results:[Place]?, error) in
                        guard error == nil else{
                            return
                        }
                        if let results = results {
                            places = results
                        }
                    })
                    expect(places.count).toEventually(equal(expectedResult.count))
                }
            }
        }
    }
}

private class PlacesAroundLocationURLFactoryMock: URLFactory {
    var basePath:String = ""
    var parameters:[String:Any] = [String:Any]()
    
    required init(withBasePath basePath:String, andParameters parameters:[String:Any]){
       
    }
    
    func url()->URL{
        return URL(string: "https://mock-url.com/service")!
    }
}
