//
//  VehicleResult.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

// MARK: - Vehicle
struct Vehicle: Decodable, Equatable {
    let id: Int
    let title: String
    let location: Location
    let price: Int
    let photo: String
    
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Location
struct Location: Decodable {
    let cityName: String
    let townName: String
}
