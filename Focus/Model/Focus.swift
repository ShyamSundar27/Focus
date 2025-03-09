//
//  Focus.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftData

enum FocusType: String, Codable, Equatable {
    case Work
    case Personal
    case Reading
    case Sleep
    case Custom
    
    init(name: String) {
        self = FocusType(rawValue: name) ?? .Custom
    }
}

@Model
class Focus {
    @Attribute(.unique)
    var id: String
    var name: String
    var iconName: String
    var type: FocusType
    
    init(
        id: String = UUID().uuidString,
        name: String,
        iconName: String,
        type: FocusType
    ) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.type = type
    }
    
    static func defaultFocuses() -> [Focus] {
        return [
            Focus(name: "Work", iconName: "case", type: .Work),
            Focus(name: "Personal", iconName: "person", type: .Personal),
            Focus(name: "Reading", iconName: "text.book.closed", type: .Reading),
            Focus(name: "Sleep", iconName: "moon", type: .Sleep)
        ]
    }
}
