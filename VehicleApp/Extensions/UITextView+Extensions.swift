//
//  UITextView+Extension.swift
//  VehicleApp
//
//  Created by Mine Rala on 9.04.2023.
//

import UIKit

extension UITextView {
    /// Gets & Sets line spacing via `typingAttributes`.
    var lineSpacing: CGFloat {
        get {
            if let style = typingAttributes[NSAttributedString.Key.paragraphStyle] {
                return (style as! NSMutableParagraphStyle).lineSpacing
            }
            return 0
        }
        set {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = newValue
            let attributes = [
                NSAttributedString.Key.paragraphStyle: style,
            ]
            typingAttributes = attributes as [NSAttributedString.Key : Any]
        }
    }
}
