//
//  User.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//


import Foundation
import SwiftData

@Model
class User: ObservableObject {
    var id: String
    var photo: Data?
    var name: String
    
    init(
        id: String = UUID().uuidString,
        name: String,
        photo: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.photo = photo
    }
}
