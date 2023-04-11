//
//  PhotoCollectionViewCell.swift
//  VehicleApp
//
//  Created by Mine Rala on 10.04.2023.
//

import UIKit

// MARK: - Class Bone
class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: - Properties
    static let nibName = "PhotoCollectionViewCell"
    static let cellReuseIdentifier = "PhotoCollectionViewCell"
    
    // MARK: - Configuration
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func setCell(url: String) {
        photoImageView.setImage(url: url)
    }
}
