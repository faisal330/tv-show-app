//
//  MenuBarCollectionViewCell.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {

    //MARK: Outlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemSeprator: UIView!
    @IBOutlet weak var itemSelectionIndicator: UIView!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ season: Season?) {
        itemLabel.text = "SEASON \(season?.season_number ?? 1)"
        toggleCellSelection(season?.isSelected ?? false)
    }
    
    func toggleCellSelection(_ isSelected: Bool) {
        itemLabel.font = isSelected
        ? (UIFont.systemFont(ofSize: 16, weight: .bold))
        : (UIFont.systemFont(ofSize: 16, weight: .regular))
        
        itemLabel.textColor = isSelected
        ? UIColor.white
        : UIColor.Color_858586
        
        itemSelectionIndicator.backgroundColor = isSelected
        ? UIColor.white
        : UIColor.clear
    }

}
