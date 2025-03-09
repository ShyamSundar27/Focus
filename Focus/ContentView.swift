//
//  ContentView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        HomeView()
        .environmentObject(Navigator())
        .modelContainer(for: [Focus.self, FocusSession.self, EarnedBadge.self, User.self, FocusInterval.self])
    }
}

#Preview {
    ContentView()
}
