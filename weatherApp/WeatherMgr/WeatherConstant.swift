//
//  WeatherConstant.swift
//  weatherApp
//
//  Created by Safa Karaca on 15.10.2024.
//

import Foundation
enum WeatherCondition: String {
    case sunny = "sunny"
    case partlyCloud = "partlyCloud"
    case rainy = "rainy"
    case snowy = "snowy"
    case notFound = "notFound"
    
    static func set(for value: Int) -> WeatherCondition {
        switch value {
        case 0:
            return sunny
        case 1,2,3:
            return partlyCloud
        case 61,63,65,66,67:
            return rainy
        case 71,73,75,77:
            return snowy
        default:
            return notFound
        }
    }
}
