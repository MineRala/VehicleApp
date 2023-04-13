//
//  MockHomeViewController.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 11.04.2023.
//

@testable import VehicleApp
import UIKit

final class MockHomeViewController: HomeViewInterface {
    
    var invokedConfigureNavigationBar: Bool = false
    var invokedConfigureNavigationBarCount = 0
    
    func configureNavigationBar() {
        invokedConfigureNavigationBar = true
        invokedConfigureNavigationBarCount += 1
    }
    
    var invokedConfigureTableView: Bool = false
    var invokedConfigureTableViewCount = 0
    
    func configureTableView() {
        invokedConfigureTableView = true
        invokedConfigureTableViewCount += 1
    }
    
    var invokedReloadTableView: Bool = false
    var invokedReloadTableViewCount = 0
    
    func reloadTableView() {
        invokedReloadTableView = true
        invokedReloadTableViewCount += 1
    }
    
    var invokedLoadIndicatorForApiRequestCompleted: Bool = false
    var invokedLoadIndicatorForApiRequestCompletedCount = 0
    
    func loadIndicatorForApiRequestCompleted() {
        invokedLoadIndicatorForApiRequestCompleted = true
        invokedLoadIndicatorForApiRequestCompletedCount += 1
    }
    
    var invokedDissmissIndicatorForApiRequestCompleted: Bool = false
    var invokedDissmissIndicatorForApiRequestCompletedCount = 0
    
    func dissmissIndicatorForApiRequestCompleted() {
        invokedDissmissIndicatorForApiRequestCompleted = true
        invokedDissmissIndicatorForApiRequestCompletedCount += 1
    }
    
    var invokedOpenDetailScreen: Bool = false
    var invokedOpenDetailScreenCount = 0
    var invokedOpenDetailScreenParameters: (result: VehicleDetailResult, Void)?
    var invokedOpenDetailScreenParametersList = [(result: VehicleDetailResult, Void)]()
    
    func openDetailScreen(result: VehicleApp.VehicleDetailResult) {
        invokedOpenDetailScreen = true
        invokedOpenDetailScreenCount += 1
        invokedOpenDetailScreenParameters = (result: result, ())
        invokedOpenDetailScreenParametersList.append((result: result, ()))
    }
    
    var invokedPickerViewRemove: Bool = false
    var invokedPickerViewRemoveCount = 0
    
    func pickerViewRemove() {
        invokedPickerViewRemove = true
        invokedPickerViewRemoveCount += 1
    }
    
    var invokedTableViewScrollToTop: Bool = false
    var invokedTableViewScrollToTopCount = 0
    
    func tableViewScrollToTop() {
        invokedTableViewScrollToTop = true
        invokedTableViewScrollToTopCount += 1
    }
    
    var invokedViewEnabilityWhenPickerOpen: Bool = false
    var invokedViewEnabilityWhenPickerOpenCount = 0
    
    func viewEnabilityWhenPickerOpen() {
        invokedViewEnabilityWhenPickerOpen = true
        invokedViewEnabilityWhenPickerOpenCount += 1
    }
    
    var invokedViewEnabilityWhenPickerClose: Bool = false
    var invokedViewEnabilityWhenPickerCloseCount = 0
    
    func viewEnabilityWhenPickerClose() {
        invokedViewEnabilityWhenPickerClose = true
        invokedViewEnabilityWhenPickerCloseCount += 1
    }
    
    var invokedConfigurePicker: Bool = false
    var invokedConfigurePickerCount = 0
    
    func configurePicker() {
        invokedConfigurePicker = true
        invokedConfigurePickerCount += 1
    }
    
    var invokedConfigureToolBar: Bool = false
    var invokedConfigureToolBarCount = 0
    
    func configureToolBar() {
        invokedConfigureToolBar = true
        invokedConfigureToolBarCount += 1
    }
    
    var invokedPickerSetSelectRow: Bool = false
    var invokedPickerSetSelectRowCount = 0
    var invokedPickerSetSelectRowParameters: (index: Int, Void)?
    var invokedPickerSetSelectRowParametersList = [(index: Int, Void)]()
    
    func pickerSetSelectRow(at index: Int) {
        invokedPickerSetSelectRow = true
        invokedPickerSetSelectRowCount += 1
        invokedPickerSetSelectRowParameters = (index: index, ())
        invokedPickerSetSelectRowParametersList.append((index: index, ()))
    }
}
