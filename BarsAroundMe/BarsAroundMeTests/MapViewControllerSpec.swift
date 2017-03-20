//
//  MapViewControllerSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//
import XCTest
import Quick
import Nimble
@testable import BarsAroundMe

class MapViewControllerSpec: QuickSpec{
    
    override func spec() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let _ = controller.view
        
        describe("when instantiating list view controller") {
            it("viewModel should be initiliased") {
                expect(controller.viewModel).notTo(beNil())
            }
        }
    }
}
