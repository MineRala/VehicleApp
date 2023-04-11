//
//  VehicleResult.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

// MARK: - Vehicle
struct Vehicle: Decodable {
    let id: Int
    let title: String
    let location: Location
    let price: Int
    let priceFormatted: String
    let photo: String
}

// MARK: - Location
struct Location: Decodable {
    let cityName: String
    let townName: String
}

