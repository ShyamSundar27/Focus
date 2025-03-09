//
//  AddFocusViewModel.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//


import SwiftUI
import SwiftData

class AddFocusViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var iconName: String = "case"
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    var context: ModelContext?

    init(context: ModelContext? = nil) {
        self.context = context
    }
    
    /// Validates and adds a new focus mode
    func addFocusData() {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMessage = "Focus Mode name cannot be empty."
            showAlert = true
            return
        }
        
        let newMode = Focus(id: UUID().uuidString, name: name, iconName: iconName, type: .Custom)
        
        context?.insert(newMode)
        try? context?.save()
    }
}
