//
//  Place.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//
import Foundation
import SwiftyJSON

public struct Place {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let id = "id"
        static let placeID = "place_id"
        static let latitude = "lat"
        static let longitude = "lng"
    }

    // MARK: Properties
    public var name: String?
    public var id: String?
    public var placeID: String?
    public var latitude: Double?
    public var longitude: Double?
    
    public init(withJSON json: JSON) {
        self.name = json[SerializationKeys.name].string
        self.id = json[SerializationKeys.id].string
        self.placeID = json[SerializationKeys.placeID].string
        
        let geometry:JSON = json["geometry"]
        let location:JSON = geometry["location"]
        self.latitude = location[SerializationKeys.latitude].double
        self.longitude = location[SerializationKeys.longitude].double
    }
}
