//
//  FocusDetailViewModel.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftData

final class FocusDetailViewModel: ObservableObject {
    var data: FocusData
    @Published var time: String?
    @Published var badgeTracker: BadgeTracker
    @Published var isTimerRunning = false
    @Published var buttonState: ButtonStates = .Start
    @Published var focusSession: FocusSession
    @Published var elapsedTimeString: String = "00:00:00"
    
    private var timer: Timer?
    
    init(data: FocusData, existingSession: FocusSession? = nil) {
        self.data = data
        self.focusSession = existingSession ?? FocusSession(focusId: data.focus.id, state: .yetToStart)
        self.badgeTracker = BadgeTracker(initialBadges: [])
        if focusSession.state == .paused {
            buttonState = .Pause
        }
    }
    
    func setupBadgeTracker(context: ModelContext) {
        let ids = focusSession.badgesEarned
        let fetchDescriptor = FetchDescriptor<EarnedBadge>(predicate: #Predicate { ids.contains($0.id) })
        
        do {
            let fetched = try context.fetch(fetchDescriptor)
            DispatchQueue.main.async {
                self.badgeTracker = BadgeTracker(initialBadges: fetched)
            }
        } catch {
            print("Error fetching badges: \(error)")
        }
    }
    
    func startTimer(context: ModelContext) {
        guard !isTimerRunning else { return }
        
        isTimerRunning = true
        focusSession.intervals.append(FocusInterval(startTime: Date.now))
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTimeAndBadge(context: context)
        }
    }
    
    func stopTimer(context: ModelContext) {
        pauseInterval()
        saveSession(context: context)
        isTimerRunning = false
        timer?.invalidate()
    }
    
    func pauseTimer() {
        guard isTimerRunning else { return }
        isTimerRunning = false
        pauseInterval()
        timer?.invalidate()
    }
    
    private func pauseInterval() {
        focusSession.intervals.last?.pauseTime = Date.now
    }
    
    private func updateTimeAndBadge(context: ModelContext) {
        formatTime(seconds: Int(focusSession.totalTimeFocused))
        addNewBadge(context: context)
    }
    
    private func formatTime(seconds: Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        
        DispatchQueue.main.async {
            self.elapsedTimeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
    
    private func addNewBadge(context: ModelContext) {
        let badgeThreshold = Int(focusSession.totalTimeFocused) / 5
        if badgeTracker.earnedBadges.count != badgeThreshold {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                let category = BadgeCategory.allCases.randomElement() ?? .laserFocus
                let badge = category.randomBadge()
                self.badgeTracker.addBadge(icon: badge, context: context)
                self.focusSession.badgesEarned = Set(self.badgeTracker.earnedBadges.map { $0.id })
            }
        }
    }
    
    func buttonPressed(context: ModelContext) {
        switch buttonState {
        case .Start:
            startTimer(context: context)
            buttonState = .Pause
        case .Pause:
            stopTimer(context: context)
            buttonState = .Start
        }
    }
    
    func saveProgress() {
        UserDefaultsUtil.shared.setLastSessionID(sessionId: focusSession.id)
    }
    
    func saveSession(context: ModelContext) {
        do {
            context.insert(focusSession)
            try context.save()
            saveProgress()
        } catch {
            print("Error saving session: \(error)")
        }
    }
    
    func clearProgress() {
        UserDefaultsUtil.shared.setLastSessionID(sessionId: nil)
    }
}
