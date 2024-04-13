//
//  UIColor+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

extension UIColor {
    static var AccentColor: UIColor {
        return UIColor(named: "AccentColor") ?? UIColor(hexString: "FFA56C")
    }
    
    static var Color_1A191B: UIColor {
        return UIColor(named: "Color#1A191B") ?? UIColor(hexString: "1A191B")
    }
    
    static var Color_111012: UIColor {
        return UIColor(named: "Color#111012") ?? UIColor(hexString: "111012")
    }
    
    static var Color_28272B: UIColor {
        return UIColor(named: "Color#28272B") ?? UIColor(hexString: "28272B")
    }
    
    static var Color_323135: UIColor {
        return UIColor(named: "Color#323135") ?? UIColor(hexString: "323135")
    }
    
    static var Color_858586: UIColor {
        return UIColor(named: "Color#858586") ?? UIColor(hexString: "858586")
    }
    
    static var Color_919191: UIColor {
        return UIColor(named: "Color#919191") ?? UIColor(hexString: "919191")
    }
    
    static var Color_FD8F5A: UIColor {
        return UIColor(named: "Color#FD8F5A") ?? UIColor(hexString: "FD8F5A")
    }

    
    convenience init(hexString: String, alpha:CGFloat = 1.0) {
        let scanner = Scanner(string: hexString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: Double(r) / 0xff,
            green: Double(g) / 0xff,
            blue: Double(b) / 0xff,
            alpha: alpha)
    }
    
}

