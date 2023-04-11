//
//  NSAttributedString+Extensions.swift
//  VehicleApp
//
//  Created by Mine Rala on 9.04.2023.
//

import Foundation

extension NSAttributedString {
    convenience init(htmlString html: String) throws {
        try self.init(data: Data(html.utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil)
    }
}
