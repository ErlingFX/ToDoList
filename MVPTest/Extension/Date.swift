//
//  Date.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import Foundation

extension DateFormatter {
    static let created: DateFormatter = {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        let dateTimeString = formatter.string(from: currentDateTime)
        return formatter
    }()
}
