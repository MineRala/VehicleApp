//
//  HomeViewModelTests.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 11.04.2023.
//

import XCTest
@testable import VehicleApp

final class HomeViewModelTests: XCTestCase {
    private var viewModel: HomeViewModel!
    private var view: MockHomeViewController!
    private var networkManager: MockNetworkManager!
    
    // before each test function
    override func setUp() {
        super.setUp()
        view = .init()
        networkManager = .init()
        viewModel = .init(view: view, storeManager: networkManager)
    }
    
    // after each test function
    override func tearDown() {
        super.tearDown()
        view =  nil
        networkManager = nil
        viewModel = nil
    }
    
    func test_numberOfRowsInSection() {
        XCTAssertEqual(viewModel.numberOfRowsInSection, 0)
        
        viewModel.vehicleList = MockVariables.vehicleList
        
        XCTAssertEqual(viewModel.numberOfRowsInSection, 2)
    }
    
    func test_numberOfRowsInComponent() {
        viewModel.sortList = MockVariables.emptySortList
        
        XCTAssertEqual(viewModel.numberOfRowsInComponent, 0)
        
        viewModel.sortList = MockVariables.sortList
        
        XCTAssertEqual(viewModel.numberOfRowsInComponent, 7)
    }
    
    func test_heightForRowAt() {
        XCTAssertEqual(viewModel.heightForRowAt, 92)
    }
    
    func test_numberOfComponents() {
        XCTAssertEqual(viewModel.numberOfComponents, 1)
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedConfigureNavigationBarCount, 0)
        XCTAssertEqual(view.invokedConfigureTableViewCount, 0)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 0)
        XCTAssertEqual(networkManager.invokeMakeRequestCount, 0)
        XCTAssertEqual(view.invokedDissmissIndicatorForApiRequestCompletedCount, 0)
        XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 0)
        XCTAssertEqual(view.invokedReloadTableViewCount, 0)

        viewModel.viewDidLoad()

        XCTAssertEqual(view.invokedConfigureNavigationBarCount, 1)
        XCTAssertEqual(view.invokedConfigureTableViewCount, 1)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 1)
//        XCTAssertEqual(networkManager.invokeMakeRequestCount, 1)
//        XCTAssertEqual(view.invokedDissmissIndicatorForApiRequestCompletedCount, 1)
//        XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 1)
//        XCTAssertEqual(view.invokedReloadTableViewCount, 1)
    }
    
    func test_viewWillAppear_InvokesRequiredMethods() {
        viewModel.isPresentingVC = MockVariables.isPresentingVC
        
        viewModel.viewWillAppear()
        
        XCTAssertTrue(viewModel.isPresentingVC)
    }
    
    func test_getVehicle_InvokesRequiredMethods() {
        XCTAssertNil(viewModel.vehicleList.first)
        
        viewModel.vehicleList = MockVariables.vehicleList
        
        XCTAssertEqual(viewModel.getVehicle(at: 0), Vehicle(
            id: 7333920,
            title: "VW BEETLE 14 TSİ RLİNE",
            location: Location(cityName: "Adana", townName: "Seyhan"),
            price: 350000,
            photo: "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg")
        )
    }
    
    func test_scrollForPagination_InvokesRequiredMethods() {
        XCTAssertEqual(viewModel.skipNumber, 0)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 0)
        XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 0)
        XCTAssertEqual(view.invokedReloadTableViewCount, 0)
        
        viewModel.scrollForPagination()
        
        XCTAssertEqual(viewModel.skipNumber, 1)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 1)
//        XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 1)
//        XCTAssertEqual(view.invokedReloadTableViewCount, 1)
    }
    
    func test_didSelectRowAt_InvokesRequiredMethods() {
        viewModel.vehicleList = MockVariables.vehicleList
       
        XCTAssertTrue(viewModel.isPresentingVC)
        
        viewModel.didSelectRowAt(at: 0)
        
        XCTAssertFalse(viewModel.isPresentingVC)
    }
    
    func test_getTitleForPickerRow_InvokesRequiredMethods() {
        viewModel.sortList = MockVariables.sortList
        
        XCTAssertEqual(viewModel.getTitleForPickerRow(at: 0), "Gelişmiş sıralama")
    }
    
    func test_setSortItem_InvokesRequiredMethods() {
        viewModel.setSortItem(at: 0)
        
        XCTAssertEqual(viewModel.sortItem, MockVariables.sortItem)
    }
    
    func test_sortButtonTapped_InvokesRequiredMethods() {
        viewModel.isSortButtonTapped = !MockVariables.isSortButtonTapped
        
        XCTAssertTrue(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedConfigurePickerCount, 0)
        XCTAssertEqual(view.invokedConfigureToolBarCount, 0)
        XCTAssertEqual(view.invokedPickerSetSelectRowCount, 0)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerOpenCount, 0)
        
        viewModel.sortButtonTapped()
        
        XCTAssertFalse(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedConfigurePickerCount, 1)
        XCTAssertEqual(view.invokedConfigureToolBarCount, 1)
        XCTAssertEqual(view.invokedPickerSetSelectRowCount, 1)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerOpenCount, 1)
    }
    
    func test_doneButtonTapped_InvokesRequiredMethods() {
        viewModel.skipNumber = MockVariables.differentSkipNumer
        viewModel.isSortButtonTapped = MockVariables.isSortButtonTapped
        XCTAssertEqual(view.invokedPickerViewRemoveCount, 0)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 0)
        XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 0)
        XCTAssertEqual(view.invokedReloadTableViewCount, 0)
        XCTAssertNotEqual(viewModel.skipNumber, 0)
        XCTAssertFalse(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerCloseCount, 0)
        XCTAssertEqual(view.invokedTableViewScrollToTopCount, 0)
        
        viewModel.doneButtonTapped()
        
        XCTAssertEqual(view.invokedPickerViewRemoveCount, 1)
        XCTAssertEqual(view.invokedLoadIndicatorForApiRequestCompletedCount, 1)
       // XCTAssertEqual(networkManager.invokeMakeRequestSuccessCount, 1)
   //     XCTAssertEqual(view.invokedReloadTableViewCount, 1)
        XCTAssertEqual(viewModel.skipNumber, 0)
        XCTAssertTrue(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerCloseCount, 1)
        XCTAssertEqual(view.invokedTableViewScrollToTopCount, 1)
    }
    
    func test_cancelButtonTapped_InvokesRequiredMethods() {
        viewModel.isSortButtonTapped = MockVariables.isSortButtonTapped
        
        XCTAssertEqual(view.invokedPickerViewRemoveCount, 0)
        XCTAssertFalse(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerCloseCount, 0)
        
        viewModel.cancelButtonTapped()
        
        XCTAssertEqual(view.invokedPickerViewRemoveCount, 1)
        XCTAssertTrue(viewModel.isSortButtonTapped)
        XCTAssertEqual(view.invokedViewEnabilityWhenPickerCloseCount, 1)
    }
}
