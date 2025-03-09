//
//  FocusDetailView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftUI

struct FocusDetailView: View {
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject var navigator: Navigator
    @Environment(\.modelContext) var context
    @StateObject var vm: FocusDetailViewModel
    @State private var isAlertShown = false
    
    var body: some View {
        ZStack(alignment: .center) {
            vm.data.BColor
            VStack {
                focusIconView
                TimerView(currentTime: $vm.elapsedTimeString)
                BadgesListView(groupedBadges: $vm.badgeTracker.groupedBadges, backgroundColor: vm.data.FColor)
                Spacer()
                actionButton
            }
        }
        .toolbar { leadingToolbarItem }
        .alert("Your Progress will be Stopped!", isPresented: $isAlertShown) { alertActions }
        .ignoresSafeArea()
        .onAppear { handleOnAppear() }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            handleScenePhaseChange(oldPhase: oldPhase, newPhase: newPhase)
        }
    }
    
}

// MARK: - Subviews
private extension FocusDetailView {
    var focusIconView: some View {
        ZStack {
            vm.data.FColor.cornerRadius(12)
            Image(systemName: vm.data.focus.iconName)
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
        .cornerRadius(50)
        .frame(width: 100, height: 100)
        .padding(.top, 100)
    }
    
    var actionButton: some View {
        Button(action: { vm.buttonPressed(context: context) }) {
            ActionButton(buttonState: $vm.buttonState)
                .padding(.bottom, 50)
                .padding(20)
        }
    }
    
    var leadingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: handleBackButtonPress) {
                Image(systemName: "chevron.left")
                    .font(XFont.XRegular(20))
                    .foregroundStyle(.black)
            }
        }
    }
    
    var alertActions: some View {
        Group {
            Button("Ok") {
                vm.stopTimer(context: context)
                navigator.reset()
                vm.clearProgress()
            }
            Button("Cancel") { isAlertShown.toggle() }
        }
    }
}

// MARK: - Helper Methods
private extension FocusDetailView {
    func handleBackButtonPress() {
        if vm.isTimerRunning {
            isAlertShown.toggle()
        } else {
            navigator.reset()
            vm.clearProgress()
        }
    }
    
    func handleScenePhaseChange(oldPhase: ScenePhase, newPhase: ScenePhase) {
        switch newPhase {
        case .active:
            vm.startTimer(context: context)
        case .background:
            vm.pauseTimer()
            vm.saveProgress()
        default:
            break
        }
    }
    
    private func handleOnAppear() {
        vm.setupBadgeTracker(context: context)
    }
    
}
