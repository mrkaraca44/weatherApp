//
//  Cityinfo.swift
//  weatherApp
//
//  Created by Safa Karaca on 5.11.2024.
//

import Foundation

enum CityInfo: String{
    case malatya = "Malatya"
    case istanbul = "İstanbul"
    case ankara = "Ankara"
    case izmir = "İzmir"
    case elazig = "Elazığ"
    case notFound = "NotFound"
    
    static func coordinates(for city: CityInfo) -> Coordinate {
        switch city {
        case .malatya:
            return Coordinate(latitude: "38.35", longitude: "38.31")
        case .istanbul:
            return Coordinate(latitude: "41.00", longitude: "28.97")
        case .ankara:
            return Coordinate(latitude: "39.93", longitude: "32.85")
        case .izmir:
            return Coordinate(latitude: "38.41", longitude: "27.12")
        case .elazig:
            return Coordinate(latitude: "38.68", longitude: "39.22")
        case .notFound:
            return Coordinate(latitude: "00.00", longitude: "00.00")
        }
}

    final class Coordinate {
        let latitude: String
        let longitude: String
        
        init(latitude: String, longitude: String) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
