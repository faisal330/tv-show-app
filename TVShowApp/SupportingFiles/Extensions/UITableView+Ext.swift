//
//  UITableView+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

public extension UITableView {
    
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UITableViewCell.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    /**
     DequeueCell by passing the type of UITableViewCell and IndexPath
     - Parameter type: UITableViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
    func registerHeaderFooter(type: UITableViewHeaderFooterView.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        self.register(UINib(nibName: cellId, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(withType type: UITableViewHeaderFooterView.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: type.identifier) as! T
    }
}
