//
//  DynamicHeightTableView.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

class DynamicHeightTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
}
