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
                    let body = MockData.placesAroundLocationResponseWithData.responseData
                    self.stub(http(.get, uri: "https://mock-url.com/service"), json(body))
                    
                    let expectedResult = MockData.placesAroundLocationResponseWithData.places
                    var places = [Place]()

                    dataProvider.fetchResults(forURL: (urlFactory?.url())!, { (  results:[Any]?, error) in
                        guard error == nil else{
                            return
                        }
                        if let results = results {
                            places = results as! [Place]
                        }
                    })
                    expect(places.count).toEventually(equal(expectedResult.count))
                }
            }
        }
        describe("when fetchResults") {
            context("with a valid response of 0 items") {
                it("should return the expected result") {
                    let body = MockData.placesAroundLocationResponseWithNoData.responseData
                    self.stub(http(.get, uri: "https://mock-url.com/service"), json(body))
                    
                    let expectedResult = MockData.placesAroundLocationResponseWithNoData.places
                    var places = [Place]()
                    
                    dataProvider.fetchResults(forURL: (urlFactory?.url())!, { (  results:[Any]?, error) in
                        guard error == nil else{
                            return
                        }
                        if let results = results {
                            places = results as! [Place]
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
