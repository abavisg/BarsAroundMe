//
//  CalloutViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

class CalloutViewViewModel: ViewViewModel{
    
    var nameString:String?
    var distanceString:String?
    
    var place:Place?
    var coordinates:CLLocationCoordinate2D?
    
    init() {
        
    }
    
    func update(with place:Place, coordinates:CLLocationCoordinate2D){
        self.place = place
        self.coordinates = coordinates
    
        nameString = place.name
        distanceString = "1 km"
    }
    
    func makeDistanceString()->String{
        return ""
    }
}
