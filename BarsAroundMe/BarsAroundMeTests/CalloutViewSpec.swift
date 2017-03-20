//
//  CalloutViewSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class CalloutViewSpec: QuickSpec{
    
    override func spec() {
        
        var view:CalloutView?
        
        var place:Place?
        place = MockData.place
        var userCoordinates:CLLocationCoordinate2D?
        userCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let viewModel = CalloutViewViewModel()
        viewModel.update(with: place!, coordinates: userCoordinates!)
      
        beforeEach {
            
            view = self.makeCell()
        }
        
        describe("when configuring") {
            context("with a view model") {
                it("nameLabel text should be the same as nameString") {
                    view?.update(with: viewModel)
                    expect(view?.nameLabel.text).toEventually(equal(viewModel.nameString))
                }
                it("distanceLabel text should be the same as distanceString") {
                    view?.configure(with: viewModel)
                    expect(view?.nameLabel.text).toEventually(equal(viewModel.nameString))
                }
                
            }
        }
    }
    
    private func makeCell() -> CalloutView {
        let cell = CalloutView()
        let views = Bundle.main.loadNibNamed("CalloutView", owner: nil, options: nil)
        let calloutView = views?[0] as! CalloutView
        return calloutView
    }
}
