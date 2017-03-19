//
//  ViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation

protocol ViewViewModel{
    var places:[Place]?{get}
    init(withDataPrvider:DataProvider)
    func refresh()
    func itemAtIndexPath(indexPath:IndexPath)->Any
    
}
