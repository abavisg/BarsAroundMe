//
//  ListCellSpec.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Quick
import Nimble
@testable import BarsAroundMe

class ListCellSpec: QuickSpec{
    
    override func spec() {
        
        var cell:PlaceListCell?
        var cellViewModel:ListCellViewModelMock = ListCellViewModelMock()
        cellViewModel.setData()
        beforeEach {
            cell = self.makeCell()
        }
        
        describe("when configuring") {
            context("with a view model") {
                it("nameLabel text should be the same as nameString") {
                    cell.configure(cellViewModel)
                    expect(cell.nameLabel.text).to(equal(cellViewModel.nameString))
                }
                it("distanceLabel text should be the same as distanceString") {
                    cell.configure(cellViewModel)
                    expect(cell.nameLabel.text).to(equal(cellViewModel.nameString))
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

private class ListCellViewModelMock: CellViewModel {
    var nameString:String?
    var distanceString:String?
    
    func setData(){
        nameString = "Pyrmont Bridge Hotel"
        distanceString = "1 km"
    }
}
