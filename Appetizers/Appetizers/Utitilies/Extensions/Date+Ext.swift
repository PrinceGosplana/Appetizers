//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 27.03.2024.
//

import Foundation

extension Date {

    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }

    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -118, to: Date())!
    }
}
