//
//  PlaceListCellSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import BarsAroundMe

class PlaceListCellSpec: QuickSpec{
    
    override func spec() {
        
        var cell:PlaceListCell?

        var place:Place?
        place = MockData.place
        var userCoordinates:CLLocationCoordinate2D?
        userCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let cellViewModel = PlaceListCellViewModel(with: place!, coordinates: userCoordinates!)
        cellViewModel.setData()
        beforeEach {
            
            
            cell = self.makeCell()
        }
        
        describe("when configuring") {
            context("with a view model") {
                it("nameLabel text should be the same as nameString") {
                    cell?.configure(with: cellViewModel)
                    expect(cell?.nameLabel.text).toEventually(equal(cellViewModel.nameString))
                }
                it("distanceLabel text should be the same as distanceString") {
                    cell?.configure(with: cellViewModel)
                    expect(cell?.nameLabel.text).toEventually(equal(cellViewModel.nameString))
                }

            }
        }
    }
    
    private func makeCell() -> PlaceListCell {
        let cell = PlaceListCell()
        cell.nameLabel = UILabel()
        cell.distanceLabel = UILabel()
        return cell
    }
}
