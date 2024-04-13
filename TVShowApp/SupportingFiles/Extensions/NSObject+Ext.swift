//
//  NSObject+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
