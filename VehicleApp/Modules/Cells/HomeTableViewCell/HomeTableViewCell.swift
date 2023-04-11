//
//  HomeTableViewCell.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import UIKit

// MARK: - Class Bone
class HomeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Properties
    static let nibName = "HomeTableViewCell"
    static let cellReuseIdentifier = "HomeTableViewCell"
    
    // MARK: - Configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vehicleImageView.image = nil
        titleLabel.text = nil
        locationLabel.text = nil
        priceLabel.text = nil
    }
}

// MARK: - UI
extension HomeTableViewCell {
    private func configureCell() {
        vehicleImageView.backgroundColor = .white
        vehicleImageView.layer.borderColor = UIColor.Palette.greySmoke.cgColor
        vehicleImageView.layer.borderWidth = 0.5
        pinImageView.backgroundColor = .clear
        titleLabel.textColor = UIColor.Palette.charcoalGrey
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.numberOfLines = 2
        locationLabel.textColor = UIColor.Palette.darkGrey
        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        priceLabel.textColor = UIColor.Palette.solidGreen
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}

// MARK: - Set Cell
extension HomeTableViewCell {
    func setCell(model: Vehicle) {
        vehicleImageView.setImage(url: model.photo.replacingOccurrences(of: "{0}", with: "800x600"))
        titleLabel.text = model.title
        locationLabel.text = "\(model.location.cityName), \(model.location.townName)"
        priceLabel.text = model.price.convertPriceToString()
    }
}

