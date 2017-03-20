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
    var userLocation:CLLocation?
    
    init() {
        
    }
    
    func update(with place:Place, and userLocation:CLLocationCoordinate2D){
        self.place = place
        self.userLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
    
        nameString = place.name
        distanceString = self.makeDistanceString()
    }
    
    func makeDistanceString()->String{
        let placeLocation = CLLocation(latitude: (place?.latitude!)!, longitude: (place?.longitude!)!)
        let distance = userLocation?.distance(from: placeLocation)
        return "\(distance!)"
    }
}
