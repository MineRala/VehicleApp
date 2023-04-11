//
//  UIButton+Extensions.swift
//  VehicleApp
//
//  Created by Mine Rala on 10.04.2023.
//

import UIKit

extension UIButton {
    func addShadow() {
        self.layer.shadowColor = UIColor.Palette.darkGrey.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .init(width: 0, height: 3)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = true
        self.clipsToBounds = false
    }
    
    func roundCorners() {
        self.layer.cornerRadius = 4
    }
}
