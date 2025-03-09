//
//  DataInitializer.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI
import SwiftData

struct DataInitializer {
    
    static func initializeDefaultUser(context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<User>(sortBy: [SortDescriptor(\.name)])
        if let users = try? context.fetch(fetchDescriptor), users.isEmpty {
            let imageData = UIImage(named: "Image")?.jpegData(compressionQuality: 1.0)
            let defaultUser = User(name: "Shyam", photo: imageData)
            context.insert(defaultUser)
            do {
                try context.save()
                print("Default user initialized successfully.")
            } catch {
                print("Error initializing default user: \(error)")
            }
        }
    }
    
    static func intializeFocusesIfNeeded(context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<Focus>(sortBy: [SortDescriptor(\.name)])
        if let currentFocuses = try? context.fetch(fetchDescriptor), currentFocuses.isEmpty {
            let defaults = Focus.defaultFocuses()
            defaults.forEach { context.insert($0) }
            do {
                try context.save()
                print("Default Focus modes seeded")
            } catch {
                print("Error saving default focuses: \(error)")
            }
        }
    }
    
    static func loadFocusDatas(context: ModelContext) -> [FocusData] {
        let fetchDescriptor = FetchDescriptor<Focus>(sortBy: [SortDescriptor(\.name)])
        let focuses = (try? context.fetch(fetchDescriptor)) ?? []
        return focuses.map { FocusData(focus: $0) }
    }
    
    static func loadUser(context: ModelContext) -> User? {
        let fetchDescriptor = FetchDescriptor<User>(sortBy: [SortDescriptor(\.name)])
        let users = (try? context.fetch(fetchDescriptor)) ?? []
        return users.first
    }
}
