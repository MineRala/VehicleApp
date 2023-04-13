//
//  Endpoint.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

// https://sandbox.arabamd.com/api/v1/listing?skip=0&take=10 -> without sorting
// https://sandbox.arabamd.com/api/v1/listing?sort=1&sortDirection=0&skip=0&take=10 -> with sorting
// https://sandbox.arabamd.com/api/v1/detail?id=15207658 -> detail

enum Endpoint {
    enum Constant {
        static let baseURL = "https://sandbox.arabamd.com/api/v1"
    }
    
    case allVehicles(sort: Int, sortDirection: Int, skip: Int)
    case detailVehicle(id: Int)
    
    var url: URL? {
        switch self {
        case .allVehicles(let sort, let sortDirection, let skip):
            if sort == -1 && sortDirection == -1 {
                return URL(string: "\(Constant.baseURL)/listing?skip=\(skip)&take=10")
            } else {
                return URL(string: "\(Constant.baseURL)/listing?sort=\(sort)&sortDirection=\(sortDirection)&skip=\(skip)&take=10")
            }
        case .detailVehicle(let id):
            return URL(string: "\(Constant.baseURL)/detail?id=\(id)")
        }
    }
}
