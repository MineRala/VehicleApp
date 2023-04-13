//
//  HomeViewModel.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var numberOfRowsInSection: Int { get }
    var numberOfRowsInComponent: Int { get }
    var heightForRowAt: Double { get }
    var numberOfComponents: Int { get }
    var skipNumber: Int { set get }
    
    func viewDidLoad()
    func viewWillAppear()
    func setVehicle(sort: Int, sortDirection: Int, skip: Int)
    func getVehicle(at index: Int) -> Vehicle
    func scrollForPagination()
    func didSelectRowAt(at index: Int)
    func getTitleForPickerRow(at index: Int) -> String?
    func setSortItem(at index: Int)
    func sortButtonTapped()
    func doneButtonTapped()
    func cancelButtonTapped()
}

// MARK: - Class Bone
final class HomeViewModel {
    // MARK: - Properties
    private weak var view: HomeViewInterface?
    private let storeManager: NetworkManagerProtocol
    internal var vehicleList = [Vehicle]()
    internal var sortList: [SortType] = [.zero, .priceAscending, .priceDescending, .dateAscending, .dateDescending, .yearAscending, .yearDescending]
    internal var sortItem: SortType = .zero
    internal var isPresentingVC = true
    internal var isSortButtonTapped = true
    internal var skipNumber = 0
    private var sortNumber = -1
    private var sortDirectionNumber = -1

    // MARK: Cons & Decons
    init(view: HomeViewInterface, storeManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.view = view
        self.storeManager = storeManager
    }
    
    private func selectedVehicle(id: Int) {
        storeManager.makeRequest(endpoint: .detailVehicle(id: id), type: VehicleDetailResult.self) { [weak self] result in
            switch result {
            case .success(let vehicleDetailResult):
                self?.view?.openDetailScreen(result: vehicleDetailResult)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - HomeViewModelInterface
extension HomeViewModel: HomeViewModelInterface {
    var numberOfRowsInSection: Int {
        vehicleList.count
    }
    
    var numberOfRowsInComponent: Int {
        sortList.count
    }
    
    var heightForRowAt: Double {
        92
    }
    
    var numberOfComponents: Int {
        1
    }
    
    func viewDidLoad() {
        view?.configureNavigationBar()
        view?.configureTableView()
        setVehicle(sort: sortNumber, sortDirection: sortDirectionNumber, skip: skipNumber)
    }
    
    func viewWillAppear() {
        isPresentingVC = true
    }
    
    func setVehicle(sort: Int, sortDirection: Int, skip: Int) {
        view?.loadIndicatorForApiRequestCompleted()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.25, execute: { [weak self] in
            self?.storeManager.makeRequest(endpoint: .allVehicles(sort: sort, sortDirection: sortDirection, skip: skip), type: [Vehicle].self) { result in
                self?.sortNumber = sort
                self?.sortDirectionNumber = sortDirection
                self?.view?.dissmissIndicatorForApiRequestCompleted()
                switch result {
                case .success(let success):
                    skip == 0 ? self?.vehicleList = success : self?.vehicleList.append(contentsOf: success)
                case .failure(let failure):
                    print(failure)
                    self?.vehicleList.removeAll()
                }
                self?.view?.reloadTableView()
            }
        })
    }
    
    func getVehicle(at index: Int) -> Vehicle {
        vehicleList[index]
    }
    
    func scrollForPagination() {
        skipNumber += 1
        setVehicle(sort: sortNumber, sortDirection: sortDirectionNumber, skip: skipNumber)
    }
    
    func didSelectRowAt(at index: Int) {
        if isPresentingVC {
            isPresentingVC = false
            selectedVehicle(id: vehicleList[index].id)
        }
    }
    
    func getTitleForPickerRow(at index: Int) -> String? {
        sortList[index].sortModel.title
    }
    
    func setSortItem(at index: Int) {
        sortItem = sortList[index]
    }
    
    func sortButtonTapped() {
        if isSortButtonTapped {
            isSortButtonTapped = false
            view?.configurePicker()
            view?.configureToolBar()
            if let index = sortList.firstIndex(of: sortItem) {
                view?.pickerSetSelectRow(at: index)
            }
            self.view?.viewEnabilityWhenPickerOpen()
        }
    }
    
    func doneButtonTapped() {
        view?.pickerViewRemove()
        setVehicle(sort: sortItem.sortModel.sortType, sortDirection: sortItem.sortModel.sortDirection, skip: 0)
        skipNumber = 0
        isSortButtonTapped = true
        view?.viewEnabilityWhenPickerClose()
        view?.tableViewScrollToTop()
    }
    
    func cancelButtonTapped() {
        view?.pickerViewRemove()
        isSortButtonTapped = true
        view?.viewEnabilityWhenPickerClose()
    }
}
