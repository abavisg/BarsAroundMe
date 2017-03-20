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
        let place = MockData.place
        let expectedLocation = CLLocation(latitude: 28.5388, longitude: -81.3756)
        let viewModel = CalloutViewViewModel()
        viewModel.update(with: place, and: expectedLocation.coordinate)
      
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
                    view?.update(with: viewModel)
                    expect(view?.nameLabel.text).toEventually(equal(viewModel.nameString))
                }
                
            }
        }
    }
    
    private func makeCell() -> CalloutView {
        let views = Bundle.main.loadNibNamed("CalloutView", owner: nil, options: nil)
        let calloutView = views?[0] as! CalloutView
        return calloutView
    }
}
