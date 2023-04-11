//
//  VehicleDetailResult.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

// MARK: - VehicleDetailResult
struct VehicleDetailResult: Decodable {
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
    
}

// MARK: - Category
struct Category: Decodable {
    let id: Int
    let name: String
}

// MARK: - Property
struct Property: Decodable {
    let name: String
    let value: String
}

// MARK: - UserInfo
struct UserInfo: Decodable {
    let nameSurname: String
    let phone: String
}
