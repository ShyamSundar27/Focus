//
//  FocusSessionUtil.swift
//  Focus
//
//  Created by shyam-15059 on 09/03/25.
//


import SwiftData
import Foundation

struct FocusSessionUtil {
    static func createFocusSession(focusId: String, context: ModelContext) -> FocusSession {
        let newSession = FocusSession(focusId: focusId, state: .yetToStart)
        context.insert(newSession)
        try? context.save()
        return newSession
    }
}
