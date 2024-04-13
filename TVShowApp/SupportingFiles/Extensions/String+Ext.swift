//
//  String+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

extension String {
    func replaceOccurrences(with replacements: [String: Any]) -> String {
        var modifiedString = self
        for (key, value) in replacements {
            modifiedString = modifiedString.replacingOccurrences(of: key, with: "\(value)")
        }
        return modifiedString
    }
}

extension String {
    func condensingWhitespace() -> String { //example "  my   name is  " -> "my name is"
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}

