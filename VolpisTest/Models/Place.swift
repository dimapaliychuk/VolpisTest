//
//  Place.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation
import Moya
import CoreLocation

class PlaceResponse: Codable {
    
    var places: [Place]?
    
    
    // compiler generated
    private enum CodingKeys: String, CodingKey {
        case places = "Result"
    }
}

class Place: Codable {
    
    var id: String?
    var title: String?
    var description: String?
    var imageUrl: String?
    var latitude: Double?
    var longitude: Double?
    var distanse: CLLocationDistance?
    var isSelected = false
    
    
    // compiler generated
    private enum CodingKeys: String, CodingKey {
        case id = "ObjectId"
        case title = "Title"
        case description = "Description"
        case imageUrl = "ImageUrl"
        case latitude = "Latitude"
        case longitude = "longitude"
    }
}
