//
//  ListCellViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

class ListCellViewModel: CellViewModel{
    
    var nameString:String?
    var distanceString:String?
    
    let place:Place?
    let coordinates:CLLocationCoordinate2D?
    
    init(with place:Place, coordinates:CLLocationCoordinate2D){
        self.place = place
        self.coordinates = coordinates
        setData()
    }
    
    func setData(){
        nameString = place?.name
        distanceString = "1 km"
    }
    
    func makeDistanceString()->String{
        return ""
    }
}
