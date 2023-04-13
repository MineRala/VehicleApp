//
//  DetailViewModel.swift
//  VehicleApp
//
//  Created by Mine Rala on 8.04.2023.
//

import Foundation
import MessageUI

protocol DetailViewModelInterface {
    var numberOfItemsInSection: Int { get }
    var numberOfRowsInSection: Int { get }
    var heightForRowAt: CGFloat { get }
    var minimumLineSpacingForSectionAt: CGFloat { get }
    var photoList: [String] { set get }
    
    func viewDidLoad()
    func phoneButtonTapped()
    func messageButtonTapped()
    func backButtonTapped()
    func getPhoto(at index: Int) -> String
    func getPhotoList() -> [String]
    func getItem(at index: Int) -> Property
    func addPhoto()
    func segmentControl(at index: Int)
    func dismiss()
}

// MARK: - Class Bone
final class DetailViewModel {
    // MARK: - Properties
    private weak var view: DetailViewInterface?
    private var vehicleDetailResult: VehicleDetailResult
    internal var tableItemList = [Property]()
    internal var photoList = [String]()
    
    // MARK: Cons & Decons
    init(view: DetailViewInterface, vehicleDetailResult: VehicleDetailResult) {
        self.view = view
        self.vehicleDetailResult = vehicleDetailResult
    }
    
    private func setTableViewList() {
        tableItemList = [Property(name: "Fiyat", value: vehicleDetailResult.price.convertPriceToString()),
                         Property(name: "İlan Tarihi", value: vehicleDetailResult.dateFormatted),
                         Property(name: "İlan No", value: String(vehicleDetailResult.id)),
                         Property(name: "Model", value: vehicleDetailResult.modelName),
                         Property(name: "Km", value: vehicleDetailResult.properties[0].value),
                         Property(name: "Renk", value: vehicleDetailResult.properties[1].value),
                         Property(name: "Yıl", value: vehicleDetailResult.properties[2].value),
                         Property(name: "Vites", value: vehicleDetailResult.properties[3].value),
                         Property(name: "Yakıt", value: vehicleDetailResult.properties[4].value),
        ]
    }
}

// MARK: - DetailViewModelInterface
extension DetailViewModel: DetailViewModelInterface {
    var numberOfItemsInSection: Int {
        photoList.count
    }
    
    var numberOfRowsInSection: Int {
        tableItemList.count
    }
    
    var heightForRowAt: CGFloat {
        44
    }
    
    var minimumLineSpacingForSectionAt: CGFloat {
        0
    }
    
    func viewDidLoad() {
        view?.configureNavigationBar()
        view?.setUI(model: vehicleDetailResult)
        view?.setupUI()
        view?.configureCollectionView()
        view?.configureSegmentedControll()
        view?.configureTableView()
        setTableViewList()
    }
    
    func phoneButtonTapped() {
        view?.makeAPhoneCall(with: vehicleDetailResult.userInfo.phone)
    }
    
    func messageButtonTapped() {
        view?.sendMessage(with: vehicleDetailResult.userInfo.phone)
    }
    
    func backButtonTapped() {
        view?.popVC()
    }
    
    func getPhoto(at index: Int) -> String {
        photoList[index]
    }
    
    func getPhotoList() -> [String] {
        photoList
    }
    
    func getItem(at index: Int) -> Property {
        tableItemList[index]
    }
    
    func addPhoto() {
        for photo in vehicleDetailResult.photos {
            photoList.append(photo.replacingOccurrences(of: "{0}", with: "800x600"))
        }
    }
    
    func segmentControl(at index: Int) {
        switch index {
        case 0:
            view?.showTableView()
        case 1:
            view?.showTextView()
        default:
            break
        }
    }
    
    func dismiss() {
        view?.dismissVC()
    }
}
