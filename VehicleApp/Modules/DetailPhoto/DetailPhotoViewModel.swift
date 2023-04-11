//
//  DetailPhotoViewModel.swift
//  VehicleApp
//
//  Created by Mine Rala on 10.04.2023.
//

import Foundation

protocol DetailPhotoViewModelInterface {    
    func viewDidLoad()
}

// MARK: - Class Bone
final class DetailPhotoViewModel {
    // MARK: - Properties
    private weak var view: DetailPhotoViewInterface?
    
    // MARK: Cons & Decons
    init(view: DetailPhotoViewInterface) {
        self.view = view
    }
}

// MARK: - DetailPhotoViewModelInterface
extension DetailPhotoViewModel: DetailPhotoViewModelInterface {
    func viewDidLoad() {
        view?.setupUI()
        view?.configureGesture()
    }
}
