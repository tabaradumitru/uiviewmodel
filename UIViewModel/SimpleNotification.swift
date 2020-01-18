//
//  SimpleNotification.swift
//  UIViewModel
//
//  Created by Dumitru Tabara on 1/9/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import Foundation

class SimpleNotification {
    var title: String
    var date: Date
    var id: String
    
    init(title: String = "Simple Notification") {
        self.title = title
        self.date = Date()
        self.id = UUID().uuidString
    }
}
