//
//  DetailTableViewCell.swift
//  VehicleApp
//
//  Created by Mine Rala on 9.04.2023.
//

import UIKit

// MARK: - Class Bone
final class DetailTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
   
    // MARK: - Properties
    static let nibName = "DetailTableViewCell"
    static let cellReuseIdentifier = "DetailTableViewCell"
   
    // MARK: - Configuration
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        valueLabel.text = nil
    }
}

// MARK: - Configure
extension DetailTableViewCell {
    private func configureCell() {
        titleLabel.textColor = UIColor.Palette.darkGrey
        valueLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        valueLabel.textAlignment = .right
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        valueLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        valueLabel.minimumScaleFactor = 0.5
        valueLabel.adjustsFontSizeToFitWidth = true
    }
}

// MARK: - Set Cell
extension DetailTableViewCell {
    func setCell(item: Property) {
        titleLabel.text = item.name
        if item.value == "" {
            valueLabel.text = "Belirtilmemiş"
        } else {
            valueLabel.text = item.value
        }
    }
}
