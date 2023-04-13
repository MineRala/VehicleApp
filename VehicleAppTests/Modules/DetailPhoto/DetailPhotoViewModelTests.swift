//
//  DetailPhotoViewModelTests.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 12.04.2023.
//

import XCTest
@testable import VehicleApp

final class DetailPhotoViewModelTests: XCTestCase {
    private var viewModel: DetailPhotoViewModel!
    private var view: MockDetailPhotoViewController!
    
    // before each test function
    override func setUp() {
        super.setUp()
        view = .init()
        viewModel = .init(view: view)
    }
    
    // after each test function
    override func tearDown() {
        super.tearDown()
        view = nil
        viewModel = nil
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedSetupUICount, 0)
        XCTAssertEqual(view.invokedconfigureGestureCount, 0)
    
        viewModel.viewDidLoad()

        XCTAssertEqual(view.invokedSetupUICount, 1)
        XCTAssertEqual(view.invokedconfigureGestureCount, 1)
    }
    
    func test_dismiss_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedDismissVCCount, 0)
        
        viewModel.dismiss()
        
        XCTAssertEqual(view.invokedDismissVCCount, 1)
    }
}
