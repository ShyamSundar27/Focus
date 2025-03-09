//
//  FocusSession.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftData
import SwiftData

@Model
class FocusSession {
    @Attribute(.unique)
    var id: String
    var focusId: String
    var intervals: [FocusInterval]
    var totalTimeFocused: TimeInterval {
        intervals.reduce(0) { $0 + $1.duration }
    }
    var badgesEarned: Set<String>
    var state: FocusState
    
    init(
        id: String = UUID().uuidString,
        focusId: String,
        intervals: [FocusInterval] = [],
        badgesEarned: Set<String> = [],
        state: FocusState
    ) {
        self.id = id
        self.focusId = focusId
        self.intervals = intervals
        self.badgesEarned = badgesEarned
        self.state = state
    }
}

enum FocusState: String, Hashable, Equatable, CaseIterable, Codable {
    case paused
    case ongoing
    case completed
    case yetToStart
}
