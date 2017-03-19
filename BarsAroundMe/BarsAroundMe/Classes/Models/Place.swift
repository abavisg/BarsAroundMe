//
//  Place.swift
//
//  Created by Giorgos Ampavis on 19/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation

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
    
    public init(withData data: [String:Any]) {
        self.name = data[SerializationKeys.name] as? String
        self.id = data[SerializationKeys.id] as? String
        self.placeID = data[SerializationKeys.placeID] as? String
        self.latitude = data[SerializationKeys.latitude] as? Double
        self.longitude = data[SerializationKeys.longitude] as? Double
    }
}
