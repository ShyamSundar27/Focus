//
//  ProfileView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @Query var focusItems: [Focus]
    @Query(sort: [SortDescriptor(\User.name, order: .forward)]) var users: [User]
    @Query var earnedBatches: [EarnedBadge]
    
    @EnvironmentObject var navigator: Navigator
    @State private var tracker = BadgeTracker(initialBadges: [])
    
    var body: some View {
        VStack(alignment: .center) {
            profileHeader
            badgesList
            Spacer()
            recentSessionsButton
        }
        .navigationBarBackButtonHidden(true)
        .toolbar { backButton }
        .background(XColor.PersonalBG)
        .onAppear { tracker = BadgeTracker(initialBadges: earnedBatches) }
    }
}

// MARK: - Subviews
private extension ProfileView {
    
    var profileHeader: some View {
        HStack {
            ProfileIcon(user: users.first ?? User(name: "Shyam"))
            Text(users.first?.name ?? "Shyam")
        }
    }
    
    var badgesList: some View {
        BadgesListView(groupedBadges: $tracker.groupedBadges, backgroundColor: XColor.PersonalBG)
            .cornerRadius(16)
            .padding()
            .frame(maxWidth: .infinity)
            .background(XColor.PersonalBG)
    }
    
    var recentSessionsButton: some View {
        Button(action: { navigator.push(to: .RecentSessions) }) {
            HStack {
                Spacer()
                Text("Recent Sessions")
                    .font(XFont.XLight(20))
                    .padding(.vertical, 25)
                Spacer()
            }
            .background(.black)
            .foregroundStyle(.white)
            .cornerRadius(25)
            .padding(20)
        }
    }
    
    var backButton: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: { navigator.goBack() }) {
                Image(systemName: "chevron.left")
                    .font(XFont.XRegular(20))
                    .foregroundStyle(.black)
            }
        }
    }
}
