//
//  LocationService.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit
import CoreLocation

@objc protocol LocationService:class{
    @objc optional func requestCurrentLocation()
}
