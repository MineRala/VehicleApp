//
//  SortModel.swift
//  VehicleApp
//
//  Created by Mine Rala on 11.04.2023.
//

import Foundation

// MARK: - Sort
struct Sort {
    let title: String
    let sortType: Int
    let sortDirection: Int
}

enum SortType {
    case zero
    case priceAscending
    case priceDescending
    case dateAscending
    case dateDescending
    case yearAscending
    case yearDescending
    
    var sortModel:  Sort {
        switch self {
        case .zero:
            return Sort(title: "Gelişmiş sıralama", sortType: -1, sortDirection: -1)
        case .priceAscending:
            return Sort(title: "Fiyata göre artan", sortType: 0, sortDirection: 0)
        case .priceDescending:
            return Sort(title: "Fiyata göre azalan", sortType: 0, sortDirection: 1)
        case .dateAscending:
            return Sort(title: "Tarihe göre artan", sortType: 1, sortDirection: 0)
        case .dateDescending:
            return Sort(title: "Tarihe göre azalan", sortType: 1, sortDirection: 1)
        case .yearAscending:
            return Sort(title: "Yıla göre artan", sortType: 2, sortDirection: 0)
        case .yearDescending:
            return Sort(title: "Yıla göre azalan", sortType: 2, sortDirection: 1)
        }
    }
    
}
