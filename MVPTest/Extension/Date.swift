//
//  File.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import Foundation

extension DateFormatter {
    
    static let created: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter
    }()
}
