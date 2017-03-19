//
//  ViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import CoreLocation

protocol ViewViewModel{
    init(withDataProvider dataProvider:DataProvider)
    func refresh(withCoordinates coordinates:CLLocationCoordinate2D)
    func itemAtIndexPath(indexPath:IndexPath)->Any
    
}
