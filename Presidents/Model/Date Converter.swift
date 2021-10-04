//
//  Date Converter.swift
//  Presidents
//
//  Created by Michael Horowitz on 4/25/21.
//

import Foundation

func dateConverter(_ date: String) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd"
    guard let newDate = formatter.date(from: date) else { return nil }
    formatter.dateFormat = "MMMM d, YYYY"
    return formatter.string(from: newDate)
}
