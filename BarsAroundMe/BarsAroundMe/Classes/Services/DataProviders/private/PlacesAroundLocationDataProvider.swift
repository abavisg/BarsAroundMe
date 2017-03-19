//
//  PlacesAroundLocationDataProvider.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import SwiftyJSON

class PlaceAroundLocationDataProvider:DataProvider {

    func fetchResults(forURL url: URL, _ completion: @escaping ([Any]?, NSError?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard error == nil else {
                completion(nil, error as NSError?)
                return
            }
            guard let data = data, let jsonArray = JSON(data: data)["results"].array else {
                let error = NSError()
                completion(nil, error)
                return
            }
            var places = [Place]()
            for i in 0..<jsonArray.count {
                let place = Place(withJSON: jsonArray[i])
                places.append(place)
            }
            completion(places, nil)
            
        }
        dataTask.resume()
    }
    
    
}
