//
//  MockDetailPhotoViewController.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 12.04.2023.
//

@testable import VehicleApp
import UIKit

final class MockDetailPhotoViewController: DetailPhotoViewInterface {
   
    var invokedSetupUI: Bool = false
    var invokedSetupUICount = 0
    
    func setupUI() {
        invokedSetupUI = true
        invokedSetupUICount += 1
    }
    
    var invokedConfigureGesture: Bool = false
    var invokedconfigureGestureCount = 0
    
    func configureGesture() {
        invokedConfigureGesture = true
        invokedconfigureGestureCount += 1
    }
    
    var invokedPopVC: Bool = false
    var invokedPopVCCount = 0
    
    func popVC() {
        invokedPopVC = true
        invokedPopVCCount += 1
    }
    
    var invokedDismissVC: Bool = false
    var invokedDismissVCCount = 0
    
    func dismissVC() {
        invokedDismissVC = true
        invokedDismissVCCount += 1
    }
}
