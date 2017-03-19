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
        static let placeID = "placeID"
        static let latitude = "latitude"
        static let longitude = "longitude"
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
        self.latitude = json[SerializationKeys.latitude].double
        self.longitude = json[SerializationKeys.longitude].double
    }
}
