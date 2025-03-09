//
//  Badges.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftData

enum BadgeCategory: String, Codable, CaseIterable, Equatable {
    case deepThinker = "Deep Thinker"
    case peaceKeeper = "Peace Keeper"
    case laserFocus = "Laser Focus"
    case mindfulMaster = "Mindful Master"
    case productivityPro = "Productivity Pro"
    case zenSeeker = "Zen Seeker"
    case goalCrusher = "Goal Crusher"
    case timeGuardian = "Time Guardian"
    
    var badgeIcon: String {
        switch self {
        case .deepThinker: return ["🧠", "🤔", "📖", "💡"].randomElement() ?? "🧠"
        case .peaceKeeper: return ["☮️", "🕊", "💙", "🌿"].randomElement() ?? "☮️"
        case .laserFocus: return ["🎯", "🔍", "👀", "🚀"].randomElement() ?? "🎯"
        case .mindfulMaster: return ["🧘‍♂️", "🕉", "🌅", "💜"].randomElement() ?? "🧘‍♂️"
        case .productivityPro: return ["✅", "📅", "📈", "🏆"].randomElement() ?? "✅"
        case .zenSeeker: return ["🌊", "🍃", "🏞", "🌸"].randomElement() ?? "🌊"
        case .goalCrusher: return ["🏆", "🥇", "🚀", "🔥"].randomElement() ?? "🏆"
        case .timeGuardian: return ["⏳", "⌛️", "🕰", "⏰"].randomElement() ?? "⏳"
        }
    }
    
    func randomBadge() -> String {
        return badgeIcon
    }
}

@Model
class EarnedBadge: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var earnedDate: Date
    
    init(icon: String, earnedDate: Date = Date()) {
        self.icon = icon
        self.earnedDate = earnedDate
    }
}
