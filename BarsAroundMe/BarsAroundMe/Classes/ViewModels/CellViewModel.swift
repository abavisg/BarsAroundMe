//
//  CellViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

protocol CellViewModel{
    init(with place:Place, coordinates:CLLocationCoordinate2D)
    func setData()
}
