//
//  UILabel+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

extension UILabel {
    var isTruncated: Bool {
       frame.width < intrinsicContentSize.width
    }

    var isClipped: Bool {
        frame.height < intrinsicContentSize.height
    }
}
