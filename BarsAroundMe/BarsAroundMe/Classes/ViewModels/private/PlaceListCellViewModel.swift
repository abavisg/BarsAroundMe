//
//  PlaceListCellViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

class PlaceListCellViewModel: CellViewModel{
    
    var nameString:String?
    var distanceString:String?
    
    let place:Place?
    var userLocation:CLLocation?
    
    init(with place:Place, coordinates:CLLocationCoordinate2D){
        self.place = place
        self.userLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        setData()
    }
    
    func setData(){
        nameString = place?.name
        distanceString = self.makeDistanceString()
    }
    
    func makeDistanceString()->String{
        let placeLocation = CLLocation(latitude: (place?.latitude!)!, longitude: (place?.longitude!)!)
        let distance = userLocation?.distance(from: placeLocation)
        return "\(distance!)"
    }
}
