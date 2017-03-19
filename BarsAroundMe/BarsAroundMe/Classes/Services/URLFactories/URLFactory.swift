//
//  URLFactory.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation

protocol URLFactory {
    
    var basePath:String { get }
    var parameters:[String:Any] {get }
    
    init(withBasePath basePath:String, andParameters parameters:[String:Any]?)
    func url()->URL
}
