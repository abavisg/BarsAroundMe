//
//  PlacesAroundLocationURLFactory.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation

class PlacesAroundLocationURLFactory :URLFactory{
    
    var basePath:String
    var parameters:[String:Any]
    
    required init(withBasePath basePath:String, andParameters parameters:[String:Any]){
        assert(parameters["location"] != nil, "parameters must contain a location")
        self.basePath = basePath
        self.parameters = parameters
    }
    
    func url()->URL{
        
        let url = URL(string: self.basePath)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "location", value: "\(parameters["location"]!)"))
        queryItems.append(URLQueryItem(name: "radius", value: "500"))
        queryItems.append(URLQueryItem(name: "types", value: "bar"))
        queryItems.append(URLQueryItem(name: "key", value: "AIzaSyBwofsXbxWZ2rci34Zs019VMy80fZgtCYI"))
        
        components.queryItems = queryItems
    
        return components.url!
    }
}
