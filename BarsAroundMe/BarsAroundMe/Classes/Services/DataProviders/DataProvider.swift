//
//  DataProvider.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation

protocol DataProvider {
    associatedtype Model
    func fetchResults(forURL url:URL, _ completion:@escaping (_ results: [Model]?, _ error: NSError?) -> Void)
}
