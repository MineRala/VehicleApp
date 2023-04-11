//
//  DetailViewController.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import UIKit
import MessageUI

private enum DetailViewConstant {
    static let navigationBarTitle = "Araç Detayı"
    static let titleTextAttributesColor = UIColor.Palette.solidGreen
    static let backButtonIcon = "arrow.backward"
    static let fontSize = 20.0
    static let phoneButtonText = "Ara"
    static let messageButtonText = "Mesaj Gönder"
}

protocol DetailViewInterface: AnyObject, ViewControllerActionPerformable {
    func configureNavigationBar()
    func setupUI()
    func configureCollectionView()
    func setUI(model: VehicleDetailResult)
    func configureSegmentedControll()
    func configureTableView()
    func makeAPhoneCall(with phoneNumber: String)
    func sendMessage(with phoneNumber: String)
    func showTableView()
    func showTextView()
}

// MARK: - Class Bone
final class DetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var lineView2: UIView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var detailTableView: UITableView!
    
    // MARK: - Properties
    private var viewModel: DetailViewModelInterface?
   
    // MARK: Cons & Decons
    convenience init(vehicleDetailResult: VehicleDetailResult) {
        self.init()
        self.viewModel = DetailViewModel(view: self, vehicleDetailResult: vehicleDetailResult)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel else { return }
        DispatchQueue.main.async {
            viewModel.viewDidLoad()
        }
    }
}

// MARK: - DetailViewInterface
extension DetailViewController: DetailViewInterface {
    func setupUI() {
        phoneButton.backgroundColor = UIColor.Palette.solidGreen
        phoneButton.setTitle(DetailViewConstant.phoneButtonText, for: .normal)
        phoneButton.setTitleColor(.black, for: .normal)
        phoneButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        phoneButton.addShadow()
        phoneButton.roundCorners()
        
        messageButton.backgroundColor = UIColor.Palette.solidGreen
        messageButton.setTitle(DetailViewConstant.messageButtonText, for: .normal)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        messageButton.addShadow()
        messageButton.roundCorners()
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = .zero
        titleLabel.minimumScaleFactor = 0.5;
        titleLabel.adjustsFontSizeToFitWidth = true;
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
       
        userNameLabel.textColor = UIColor.Palette.charcoalGrey
        userNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        userNameLabel.textAlignment = .center
        
        lineView.backgroundColor = UIColor.Palette.solidGreen
        
        categoryNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        categoryNameLabel.textAlignment = .center
        categoryNameLabel.textColor = UIColor.Palette.solidGreen
        categoryNameLabel.minimumScaleFactor = 0.5
        categoryNameLabel.adjustsFontSizeToFitWidth = true
        
        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        locationLabel.textAlignment = .center
        locationLabel.textColor = UIColor.Palette.darkGrey
        
        lineView2.backgroundColor = UIColor.Palette.solidGreen
        
        descTextView.isEditable = false
        descTextView.isScrollEnabled = true
        descTextView.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        descTextView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descTextView.textColor = UIColor.Palette.darkGrey
        descTextView.lineSpacing = 6
    }
    
    func setUI(model: VehicleDetailResult) {
        titleLabel.text = model.title.uppercased()
        viewModel?.addPhoto()
        userNameLabel.text = model.userInfo.nameSurname.uppercased()
        categoryNameLabel.text = "Araçlar>" + model.category.name.replacingOccurrences(of: "/", with: ">")
        locationLabel.text = "\(model.location.cityName), \(model.location.townName)"
        descTextView.attributedText = try? NSAttributedString(htmlString: model.text)
    }
    
    func configureNavigationBar() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButtonTapped))
        if #available(iOS 13.0, *) {
            backButton.setBackgroundImage(UIImage(systemName: DetailViewConstant.backButtonIcon), for: .normal, barMetrics: .default)
        } else {
            backButton.setBackgroundImage(UIImage(named: "leftArrowGray"), for: .normal, barMetrics: .default)
        }
        backButton.tintColor = DetailViewConstant.titleTextAttributesColor
        navigationItem.setLeftBarButton(backButton, animated: false)
        navigationItem.title = DetailViewConstant.navigationBarTitle
        let attributes = [NSAttributedString.Key.foregroundColor: DetailViewConstant.titleTextAttributesColor , NSAttributedString.Key.font : UIFont.systemFont(ofSize: DetailViewConstant.fontSize, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    func configureCollectionView() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: PhotoCollectionViewCell.nibName, bundle: .main), forCellWithReuseIdentifier: PhotoCollectionViewCell.cellReuseIdentifier)
        photoCollectionView.reloadData()
    }
    
    func configureSegmentedControll() {
        if #available(iOS 13.0, *) {
            segmentedControll.selectedSegmentTintColor = UIColor.Palette.solidGreen
        } else {
                segmentedControll.tintColor = UIColor.Palette.solidGreen
        }
        segmentedControll.setTitle("İlan Bilgileri", forSegmentAt: 0)
        segmentedControll.setTitle("Açıklama", forSegmentAt: 1)
        descTextView.isHidden = true
        detailTableView.isHidden = false
        detailTableView.reloadData()
    }
    
    func configureTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: DetailTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: DetailTableViewCell.cellReuseIdentifier)
    }
    
    func makeAPhoneCall(with phoneNumber: String) {
        if let url = URL(string: "telprompt:\(phoneNumber)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func sendMessage(with phoneNumber: String) {
        guard MFMessageComposeViewController.canSendText() else {
            print("Device is not capable to send messages")
            return
        }
        
        let composer = MFMessageComposeViewController()
        composer.messageComposeDelegate = self
        composer.recipients = [phoneNumber]
        composer.body = ""
        present(composer, animated: true)
    }
    
    func showTableView() {
        detailTableView.isHidden = false
        descTextView.isHidden = true
    }
    
    func showTextView() {
        detailTableView.isHidden = true
        descTextView.isHidden = false
    }
}

// MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItemsInSection ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        if let viewModel = viewModel {
            cell.setCell(url: viewModel.getPhoto(at: indexPath.item))
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        viewModel?.minimumLineSpacingForSectionAt ?? 0
    }
}

// MARK: - UICollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewModel = viewModel {
            let vc = DetailPhotoViewController(url: viewModel.getPhoto(at: indexPath.item))
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRowsInSection ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.cellReuseIdentifier, for: indexPath) as! DetailTableViewCell
        if let viewModel = viewModel {
            cell.setCell(item: viewModel.getItem(at: indexPath.row))
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel?.heightForRowAt ?? 1
    }
}

// MARK: - Actions
extension DetailViewController {
    @IBAction func segmentedControllChanged(_ sender: Any) {
        viewModel?.segmentControl(at: segmentedControll.selectedSegmentIndex)
    }
    
    @objc func backButtonTapped() {
        viewModel?.backButtonTapped()
    }
    
    @IBAction func phoneButtonTapped(_ sender: Any) {
        viewModel?.phoneButtonTapped()
    }
    
    
    @IBAction func messageButtonTapped(_ sender: Any) {
        viewModel?.messageButtonTapped()
    }
    
}

// MARK: - MFMessageComposeViewControllerDelegate
extension DetailViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("Cancelled")
        case .sent:
            print("Sent")
        case .failed:
            print("Failed")
        default:
            print("Unknown")
        }
        dismissVC()
    }
}


