//
//  HomeViewController.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import UIKit

private enum HomeViewConstant {
    static let navigationBarTitle = "Araçlar"
    static let titleTextAttributesColor = UIColor.Palette.solidGreen
    static let fontSize = 20.0
}

protocol HomeViewInterface: AnyObject {
    func configureNavigationBar()
    func configureTableView()
    func reloadTableView()
    func loadIndicatorForApiRequestCompleted()
    func dissmissIndicatorForApiRequestCompleted()
    func openDetailScreen(result: VehicleDetailResult)
    func pickerViewRemove()
    func tableViewScrollToTop()
    func viewEnabilityWhenPickerOpen()
    func viewEnabilityWhenPickerClose()
    func configurePicker()
    func configureToolBar()
    func pickerSetSelectRow(at index: Int)
}

// MARK: - Class Bone
final class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var vehicleTableView: UITableView!
 
    // MARK: - Properties
    private lazy var viewModel: HomeViewModelInterface = HomeViewModel(view: self)
    var picker  = UIPickerView()
    var toolBar = UIToolbar()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
       
    }
}

// MARK: - HomeViewInterface
extension HomeViewController: HomeViewInterface {
    func configureNavigationBar() {
        self.navigationItem.title = "Araçlar"
        let attributes = [NSAttributedString.Key.foregroundColor: HomeViewConstant.titleTextAttributesColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: HomeViewConstant.fontSize, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(sortButtonTapped))
        rightButton.setBackgroundImage(UIImage(named: "sortIcon"), for: .normal, barMetrics: .default)
        navigationItem.setRightBarButton(rightButton, animated: false)
    }
    
    func configureTableView() {
        vehicleTableView.dataSource = self
        vehicleTableView.delegate = self
        vehicleTableView.register(UINib(nibName: HomeTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.cellReuseIdentifier)
        vehicleTableView.reloadData()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.vehicleTableView.reloadData()
        }
    }
    
    func loadIndicatorForApiRequestCompleted() {
        DispatchQueue.main.async {
            self.showLoadingView()
        }
    }
    
    func dissmissIndicatorForApiRequestCompleted() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(10), execute: {
            self.dismissLoadingView()
        })
    }
    
    func openDetailScreen(result: VehicleDetailResult) {
        DispatchQueue.main.async {
            let vc = DetailViewController(vehicleDetailResult: result)
            self.openView(vc: vc)
        }
    }
    
    func pickerViewRemove() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    func tableViewScrollToTop() {
        let topRow = IndexPath(row: 0, section: 0)
        self.vehicleTableView.scrollToRow(at: topRow, at: .top, animated: false)
    }
    
    func viewEnabilityWhenPickerOpen() {
        vehicleTableView.isUserInteractionEnabled = false
        picker.isUserInteractionEnabled = true
    }
    
    func viewEnabilityWhenPickerClose() {
        vehicleTableView.isUserInteractionEnabled = true
        picker.isUserInteractionEnabled = false
    }
    
    func configurePicker() {
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
    }
    
    func configureToolBar() {
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let titleButton = UIBarButtonItem(title: "Sıralama Kriteri seçin", style: .plain, target: nil, action: nil)
        titleButton.isEnabled = false
        let cancelButton = UIBarButtonItem.init(title: "Vazgeç", style: .plain, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = UIColor.black.withAlphaComponent(0.5)
        let doneButton = UIBarButtonItem.init(title: "Uygula", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = UIColor.Palette.solidGreen
        toolBar.items = [cancelButton, flexSpace, titleButton, flexSpace, doneButton]
        self.view.addSubview(toolBar)
    }
    
    func pickerSetSelectRow(at index: Int) {
        picker.selectRow(index, inComponent: 0, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellReuseIdentifier, for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.setCell(model: viewModel.getVehicle(at: indexPath.row))
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vehicleTableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRowAt(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt
    }
}

// MARK: - Actions
extension HomeViewController {
    @objc func sortButtonTapped() {
        viewModel.sortButtonTapped()
    }
        
    @objc func doneButtonTapped() {
        viewModel.doneButtonTapped()
    }
    
    @objc func cancelButtonTapped() {
        viewModel.cancelButtonTapped()
    }
}

// MARK: - ScrollViewDelegate
extension HomeViewController {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            viewModel.scrollForPagination()
        }
    }
}

// MARK: - UIPickerViewDataSource
extension HomeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRowsInComponent
    }
    
}


// MARK: - UIPickerViewDelegate
extension HomeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getTitleForPickerRow(at: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.setSortItem(at: row)
    }
}
