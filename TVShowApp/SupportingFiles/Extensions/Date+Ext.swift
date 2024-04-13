//
//  Date+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation
extension Date {
    static func getFormattedDate(string: String? , format: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = Constants.yyyy_MM_dd

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        dateFormatterPrint.amSymbol = "AM"
        dateFormatterPrint.pmSymbol = "PM"
        
        let date: Date? = dateFormatterGet.date(from: string ?? Date().description)?.toLocalTime()
        return dateFormatterPrint.string(from: date!);
    }
}

extension Date {
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}

