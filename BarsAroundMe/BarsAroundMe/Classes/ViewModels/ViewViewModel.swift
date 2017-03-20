//
//  ViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

protocol ViewViewModel{
    associatedtype Data
    func update(with place:Data, and userLocation:CLLocationCoordinate2D)
}
