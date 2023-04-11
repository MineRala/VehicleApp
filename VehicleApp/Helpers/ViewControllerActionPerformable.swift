//
//  ViewControllerActionPerformable.swift
//  VehicleApp
//
//  Created by Mine Rala on 11.04.2023.
//

import UIKit

protocol ViewControllerActionPerformable {
    func popVC()
    func dismissVC()
}

extension ViewControllerActionPerformable where Self: UIViewController {
    func popVC () {
        navigationController?.popViewController(animated: true)
    }
    
    func dismissVC() {
        self.dismiss(animated: true)
    }
}
