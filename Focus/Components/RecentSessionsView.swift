//
//  RecentSessionsView.swift
//  Focus
//
//  Created by shyam-15059 on 10/03/25.
//

import SwiftData
import SwiftUI
import SwiftData

struct RecentSessionsView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var navigator: Navigator
    @Query
    private var sessions: [FocusSession]
    
    @Query private var focusItems: [Focus]
    
    let colors: [Color] = [.blue, .green, .orange, .purple, .red, .yellow]
    
    private var recentSessions: [FocusSession] {
        let twoHoursAgo = Date().addingTimeInterval(-2 * 60 * 60)
        return sessions.filter { session in
            session.intervals.first?.startTime ?? Date.distantPast >= twoHoursAgo
        }
    }
    
    private func focusName(for focusId: String) -> Focus {
        focusItems.first(where: { $0.id == focusId }) ?? Focus(name: "Work", iconName: "case", type: .Work)
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var body: some View {
        VStack {
            Text("Recent Sessions")
                .font(XFont.XBold(24))
                .foregroundColor(.black)
            Spacer()
            List(recentSessions.indices, id: \.self) { index in
                let session = recentSessions[index]
                let focusId = session.focusId
                let focus = focusName(for: focusId)
                let focusMode = DataSource(context: context).focusMode(for: focus.name)
                
                let dataSourceColor = focusMode?.BColor
                let rowColor = dataSourceColor ?? colors[index % colors.count]
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("\(focus.name)")
                            .font(XFont.XBold(18))
                            .foregroundColor(.black)
                        Spacer()
                        ZStack {
                            focusMode?.BColor
                                .cornerRadius(12)
                            Image(systemName: focus.iconName)
                                .resizable()
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        }
                        .frame(width: 24, height: 24)
                    }
                    
                    
                    if let startTime = session.intervals.first?.startTime {
                        Text("Start Time: \(startTime.formatted(.dateTime.hour().minute()))")
                            .font(XFont.XLight(14))
                            .foregroundColor(.black)
                    }
                    
                    Text("Badges Earned: \(session.badgesEarned.count)")
                        .font(XFont.XLight(14))
                        .foregroundColor(.black)
                    
                    Text("Total Time Spent: \(formattedTime(session.totalTimeFocused))")
                        .font(XFont.XLight(14))
                        .foregroundColor(.black)
                }
                .padding(12)
                .cornerRadius(10)
                .listRowBackground(rowColor)
            }
            .background(Color.white)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navigator.goBack()
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(XFont.XRegular(20))
                        .foregroundStyle(.black)
                }
                
            }
        }
        
    }
}
