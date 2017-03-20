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
    func update(with place:Place, coordinates:CLLocationCoordinate2D)
}
