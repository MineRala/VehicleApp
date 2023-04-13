//
//  VehicleDetailResult.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

// MARK: - VehicleDetailResult
struct VehicleDetailResult: Decodable, Equatable {
    let id: Int
    let title: String
    let location: Location
    let category: Category
    let modelName: String
    let price: Int
    let dateFormatted: String
    let photos: [String]
    let properties: [Property]
    let text: String
    let userInfo: UserInfo
    
    public static func == (lhs: VehicleDetailResult, rhs: VehicleDetailResult) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Category
struct Category: Decodable {
    let id: Int
    let name: String
}

// MARK: - Property
struct Property: Decodable, Equatable {
    let name: String
    let value: String
    
    public static func == (lhs: Property, rhs: Property) -> Bool {
        return lhs.name == rhs.name && lhs.value == lhs.value
    }
}

// MARK: - UserInfo
struct UserInfo: Decodable {
    let nameSurname: String
    let phone: String
}
