//
//  MockDetailViewController.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 12.04.2023.
//

@testable import VehicleApp
import UIKit

final class MockDetailViewController: DetailViewInterface {
    
    var invokedConfigureNavigationBar: Bool = false
    var invokedConfigureNavigationBarCount = 0
    
    func configureNavigationBar() {
        invokedConfigureNavigationBar = true
        invokedConfigureNavigationBarCount += 1
    }
    
    var invokedConfigurSetupUI: Bool = false
    var invokedConfigurSetupUICount = 0
    
    func setupUI() {
        invokedConfigurSetupUI = true
        invokedConfigurSetupUICount += 1
    }
    
    var invokedConfigureCollectionView: Bool = false
    var invokedConfigureCollectionViewCount = 0
    
    func configureCollectionView() {
        invokedConfigureCollectionView = true
        invokedConfigureCollectionViewCount += 1
    }
    
    var invokedSetUI: Bool = false
    var invokedSetUICount = 0
    var invokedSetUIParameters: (model: VehicleDetailResult, Void)?
    var invokedSetUIParametersList = [(model: VehicleDetailResult, Void)]()
    
    func setUI(model: VehicleApp.VehicleDetailResult) {
        invokedSetUI = true
        invokedSetUICount += 1
        invokedSetUIParameters = (model: model, ())
        invokedSetUIParametersList = [(model: model, ())]
    }
    
    var invokedConfigureSegmentedControll: Bool = false
    var invokedConfigureSegmentedControllCount = 0
    
    func configureSegmentedControll() {
        invokedConfigureSegmentedControll = true
        invokedConfigureSegmentedControllCount += 1
    }
    
    var invokedConfigureTableView: Bool = false
    var invokedConfigureTableViewCount = 0
    
    func configureTableView() {
        invokedConfigureTableView = true
        invokedConfigureTableViewCount += 1
    }
    
    var invokedMakeAPhoneCall: Bool = false
    var invokedMakeAPhoneCallCount = 0
    var invokedMakeAPhoneCallParameters: (phoneNumber: String, Void)?
    var invokedMakeAPhoneCallParametersList = [(phoneNumber: String, Void)]()
    
    func makeAPhoneCall(with phoneNumber: String) {
        invokedMakeAPhoneCall = true
        invokedMakeAPhoneCallCount += 1
        invokedMakeAPhoneCallParameters = (phoneNumber: phoneNumber, ())
        invokedMakeAPhoneCallParametersList.append((phoneNumber: phoneNumber, ()))
    }
    
    var invokedSendMessage: Bool = false
    var invokedSendMessageCount = 0
    var invokedSendMessageParameters: (phoneNumber: String, Void)?
    var invokedSendMessageParametersList = [(phoneNumber: String, Void)]()
    
    func sendMessage(with phoneNumber: String) {
        invokedSendMessage = true
        invokedSendMessageCount += 1
        invokedSendMessageParameters = (phoneNumber: phoneNumber, ())
        invokedSendMessageParametersList.append((phoneNumber: phoneNumber, ()))
    }
    
    var invokedShowTableView: Bool = false
    var invokedShowTableViewCount = 0
    
    func showTableView() {
        invokedShowTableView = true
        invokedShowTableViewCount += 1
    }
    
    var invokedShowTextView: Bool = false
    var invokedShowTextViewCount = 0
    
    func showTextView() {
        invokedShowTextView = true
        invokedShowTextViewCount += 1
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
