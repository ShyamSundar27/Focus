//
//  FocusApp.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI
import SwiftData

@main
struct FocusApp: App {
    
    @Environment(\.modelContext) private var context
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
