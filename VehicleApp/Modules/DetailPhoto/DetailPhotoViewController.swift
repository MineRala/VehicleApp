//
//  DetailPhotoViewController.swift
//  VehicleApp
//
//  Created by Mine Rala on 9.04.2023.
//

import UIKit

protocol DetailPhotoViewInterface: AnyObject, ViewControllerActionPerformable {
    func setupUI()
    func configureGesture()
}

// MARK: - Class Bone
final class DetailPhotoViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Properties
    var url: String
    private lazy var viewModel: DetailPhotoViewModelInterface = DetailPhotoViewModel(view: self)
    
    // MARK: Cons & Decons
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}

// MARK: - DetailPhotoViewInterface
extension DetailPhotoViewController: DetailPhotoViewInterface {
    func setupUI() {
        self.view.backgroundColor = UIColor.Palette.azure
        closeButton.setImage(UIImage(named: "closeIcon"), for: .normal)
        closeButton.layer.cornerRadius = 16
        closeButton.layer.masksToBounds = true
        newImageView.setImage(url: url)
    }
    
    func configureGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        gesture.direction = .down
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
}

// MARK: - Actions
extension DetailPhotoViewController {
    @objc private func swipeAction() {
        dismissVC()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismissVC()
    }
}
