//
//  UIImageView+Extension.swift
//  VehicleApp
//
//  Created by Mine Rala on 8.04.2023.
//

import UIKit

extension UIImageView {
    func setImage(url: String) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { /// execute on main thread
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
