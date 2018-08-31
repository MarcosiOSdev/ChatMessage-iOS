//
//  Date+Custom.swift
//  ChatMessage
//
//  Created by Marcos Felipe Souza on 30/08/2018.
//  Copyright © 2018 Marcos. All rights reserved.
//

import Foundation

extension Date {
    
    init(stringDate: String) {
        let convert = DateFormatter()
        convert.dateFormat = "dd/MM/yyyy"
        self = convert.date(from: stringDate) ?? Date()
    }
}
