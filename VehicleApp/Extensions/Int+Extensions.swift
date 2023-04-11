//
//  String+Extensions.swift
//  VehicleApp
//
//  Created by Mine Rala on 9.04.2023.
//

import Foundation

extension Int {
    func convertPriceToString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "tr_TR")
        return (formatter.string(from: NSNumber(value: self))?.replacingOccurrences(of: "₺", with: "").replacingOccurrences(of: ",00", with: "") ?? "") + " TL"
    }
}
