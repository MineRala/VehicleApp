//
//  DetailViewModelTests.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 12.04.2023.
//

import XCTest
@testable import VehicleApp

final class DetailViewModelTests: XCTestCase {
    private var viewModel: DetailViewModel!
    private var view: MockDetailViewController!

    // before each test function
    override func setUp() {
        super.setUp()
        view = .init()
        viewModel = .init(view: view, vehicleDetailResult: MockVariables.mockDetailResult)
    }
    
    // after each test function
    override func tearDown() {
        super.tearDown()
        view =  nil
        viewModel = nil
    }
    
    func test_numberOfItemsInSection() {
        XCTAssertEqual(viewModel.numberOfRowsInSection, 0)
        
        viewModel.photoList = MockVariables.mockPhotoList
        
        XCTAssertEqual(viewModel.numberOfItemsInSection, 2)
    }
    
    func test_numberOfRowsInSection() {
        XCTAssertEqual(viewModel.numberOfRowsInSection, 0)
        
        viewModel.tableItemList = MockVariables.mockTableItemList
        
        XCTAssertEqual(viewModel.numberOfRowsInSection, 9)
    }
    
    func test_heightForRowAt() {
        XCTAssertEqual(viewModel.heightForRowAt, 44)
    }
    
    func test_minimumLineSpacingForSectionAt() {
        XCTAssertEqual(viewModel.minimumLineSpacingForSectionAt, 0)
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {
        var tableItemList =  [Property]()
        let detailResult = VehicleDetailResult(
            id: 7333920,
            title: "VW BEETLE 14 TSİ RLİNE",
            location: Location(cityName: "Adana", townName: "Seyhan"),
            category: Category(id: 12799, name: "otomobil/volkswagen-new-beetle-1-4-tsi-design"),
            modelName:  "Beetle 1.4 TSI Design DSG",
            price: 350000,
            dateFormatted: "30 Kasım 2020",
            photos: [
                "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg",
                "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/e99a0838-3f70-464c-86d6-cfee827fa5ad_image_for_silan_7333920_{0}.jpg"
            ],
            properties: [
                Property(name: "km", value: "23000"),
                Property(name: "color", value: "Kırmızı"),
                Property(name: "year", value: "2013"),
                Property(name: "gear", value: "Yarı Otomatik"),
                Property(name: "fuel", value: "Benzin")
            ],
            text: "ARACIMIZ İLK ELDEN OLUP DARBE DEGİSEN BOYA&nbsp; HASARKAYDİ YOKTUR İC DİS RLİNE PAKET OLUP EMSALSİZ TEMİZLİKTE VE 23000 KMDEDİR DETAYLİBİLGİ İCİN ARAYİNİZ&nbsp;",
            userInfo: UserInfo(nameSurname: "Sonia Norris", phone: "9009315760")
        )
        
        XCTAssertEqual(view.invokedConfigureNavigationBarCount, 0)
        XCTAssertEqual(view.invokedSetUIParametersList.map(\.model), [])
        XCTAssertEqual(view.invokedConfigurSetupUICount, 0)
        XCTAssertEqual(view.invokedConfigureCollectionViewCount, 0)
        XCTAssertEqual(view.invokedConfigureSegmentedControllCount, 0)
        XCTAssertEqual(view.invokedConfigureTableViewCount, 0)
        XCTAssertEqual(tableItemList.count, 0)
        
        tableItemList = MockVariables.mockTableItemList
        viewModel.viewDidLoad()
        
        XCTAssertEqual(view.invokedConfigureNavigationBarCount, 1)
        XCTAssertEqual(view.invokedSetUIParametersList.map(\.model), [detailResult])
        XCTAssertEqual(view.invokedConfigurSetupUICount, 1)
        XCTAssertEqual(view.invokedConfigureCollectionViewCount, 1)
        XCTAssertEqual(view.invokedConfigureSegmentedControllCount, 1)
        XCTAssertEqual(view.invokedConfigureTableViewCount, 1)
        XCTAssertEqual(tableItemList.count, 9)
    }
    
    func test_phoneButtonTapped_InvokesRequiredMethods() {
        XCTAssertTrue(view.invokedMakeAPhoneCallParametersList.isEmpty)
        
        viewModel.phoneButtonTapped()
        
        XCTAssertEqual(view.invokedMakeAPhoneCallParametersList.map(\.phoneNumber), ["9009315760"])
    }
    
    func test_messageButtonTapped_InvokesRequiredMethods() {
        XCTAssertTrue(view.invokedSendMessageParametersList.isEmpty)
        
        viewModel.messageButtonTapped()
        
        XCTAssertEqual(view.invokedSendMessageParametersList.map(\.phoneNumber), ["9009315760"])
    }
    
    func test_backButtonTapped_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedPopVCCount, 0)
        
        viewModel.backButtonTapped()
        
        XCTAssertEqual(view.invokedPopVCCount, 1)
    }
    
    func test_getPhoto_InvokesRequiredMethods() {
        XCTAssertNil(viewModel.photoList.first)
        
        viewModel.photoList = MockVariables.mockPhotoList
        
        XCTAssertEqual(viewModel.getPhoto(at: 0), "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg")
    }
    
    func test_getPhotoList_InvokesRequiredMethods() {
        XCTAssertTrue(viewModel.photoList.isEmpty)
        
        viewModel.photoList = MockVariables.mockPhotoList
        
        XCTAssertEqual(viewModel.getPhotoList(),
                       [
                        "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg",
                        "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/e99a0838-3f70-464c-86d6-cfee827fa5ad_image_for_silan_7333920_{0}.jpg"
                       ])
    }
    
    func test_getItem_InvokesRequiredMethods() {
        XCTAssertNil(viewModel.tableItemList.first)
        
        viewModel.tableItemList = MockVariables.mockTableItemList
        
        XCTAssertEqual(viewModel.getItem(at: 0), Property(name: "Fiyat", value: "350000"))
    }
    
    func test_addPhoto_InvokesRequiredMethods() {
        viewModel.addPhoto()
        
        XCTAssertEqual(MockVariables.mockPhotoList.count, 2)
    }
    
    func test_segmentControl_WithFirstIndex_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedShowTableViewCount, 0)
        
        viewModel.segmentControl(at: 0)
        
        XCTAssertEqual(view.invokedShowTableViewCount, 1)
    }
    
    func test_segmentControl_WithSecondIndex_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedShowTextViewCount, 0)
        
        viewModel.segmentControl(at: 1)
        
        XCTAssertEqual(view.invokedShowTextViewCount, 1)
    }
    
    func test_segmentControl_WithOtherIndex_InvokesRequiredMethods() {
        viewModel.segmentControl(at: Int.random(in: 3..<100))
        
        XCTAssertEqual(view.invokedShowTableViewCount, 0)
        XCTAssertEqual(view.invokedShowTextViewCount, 0)
    }
    
    func test_dismiss_InvokesRequiredMethods() {
        XCTAssertEqual(view.invokedDismissVCCount, 0)
        
        viewModel.dismiss()
        
        XCTAssertEqual(view.invokedDismissVCCount, 1)
    }
}
