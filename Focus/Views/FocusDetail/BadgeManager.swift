//
//  BadgeManager.swift
//  Focus
//
//  Created by shyam-15059 on 09/03/25.
//

import Foundation
import SwiftData

final class BadgeTracker: ObservableObject {
    @Published var earnedBadges: [EarnedBadge] = [] {
        didSet {
            updateGroupedBadges()
        }
    }
    
    @Published var groupedBadges: [String: Int] = [:]
    
    init(initialBadges: [EarnedBadge] = []) {
        self.earnedBadges = initialBadges
        updateGroupedBadges()
    }
    
    private func updateGroupedBadges() {
        groupedBadges = Dictionary(grouping: earnedBadges, by: { $0.icon })
            .mapValues { $0.count }
    }
    
    func addBadge(icon: String, context: ModelContext? = nil) {
        if let ctx = context, let badge = BadgeManager.addBadge(icon: icon, context: ctx) {
            earnedBadges.append(badge)
        } else {
            let badge = EarnedBadge(icon: icon)
            earnedBadges.append(badge)
        }
    }
}

struct BadgeManager {
    
    static func addBadge(icon: String, context: ModelContext) -> EarnedBadge? {
        let badge = EarnedBadge(icon: icon)
        context.insert(badge)
        do {
            try context.save()
            return badge
        } catch {
            print("Failed to save badge: \(error)")
            return nil
        }
    }
    
    
    static func groupBadges(from badges: [EarnedBadge]) -> [String: Int] {
        let grouped = Dictionary(grouping: badges, by: { $0.icon })
        return grouped.mapValues { $0.count }
    }
}

