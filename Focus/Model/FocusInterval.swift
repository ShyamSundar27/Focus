//
//  FocusInterval.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftData

@Model
class FocusInterval {
    var startTime: Date
    var pauseTime: Date?
    
    init(
        startTime: Date,
        pauseTime: Date? = nil
    ) {
        self.startTime = startTime
        self.pauseTime = pauseTime
    }
    
    var duration: TimeInterval {
        if let pauseTime = pauseTime {
            return pauseTime.timeIntervalSince(startTime)
        } else {
            return Date().timeIntervalSince(startTime)
        }
    }
}
