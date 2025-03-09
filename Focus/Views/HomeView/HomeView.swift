//
//  HomeView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftUI
import SwiftData

struct HomeView: View {
    @EnvironmentObject var navigator: Navigator
    @Environment(\.modelContext) var context
    
    @State private var showAddModeSheet = false
    
    private var homeDataSource: DataSource {
        DataSource(context: context)
    }
    
    private var user: User {
        homeDataSource.user ?? User(name: "Shyam")
    }
    
    var body: some View {
        NavigationStack(path: $navigator.routes) {
            VStack(alignment: .leading) {
                headerView
                addButton
                focusListView
                Spacer()
            }
            .toolbar { leadingToolbarItem }
            .navigationDestination(for: Routes.self) { $0 }
            .sheet(isPresented: $showAddModeSheet) { addModeSheetView }
            .ignoresSafeArea()
            .onAppear(perform: checkForLastSession)
        }
    }
}

// MARK: - Subviews
private extension HomeView {
    var headerView: some View {
        HeaderTextView(prefixText: "one. two. ", highlightText: "focus!")
            .padding(.top, 120)
            .padding(.leading, 20)
    }
    
    var addButton: some View {
        Button(action: { showAddModeSheet.toggle() }) {
            AddButton().padding()
        }
    }
    
    var focusListView: some View {
        List {
            ForEach(homeDataSource.data, id: \.self) { data in
                FocusCard(data: data)
                    .onTapGesture { navigateToDetail(for: data) }
            }
        }
        .listStyle(.plain)
    }
    
    var leadingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: { navigator.push(to: .Profile) }) {
                userProfileView
            }
        }
    }
    
    var userProfileView: some View {
        HStack {
            ProfileIcon(user: user)
            HStack(spacing: 0) {
                Text("Hi, ")
                    .font(XFont.XLight(18))
                    .foregroundColor(.gray)
                
                Text(user.name)
                    .font(XFont.XLight(18))
                    .foregroundColor(.black)
            }
        }
    }
    
    var addModeSheetView: some View {
        AddFocusView()
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.automatic)
    }
}

// MARK: - Helper Methods
private extension HomeView {
    func navigateToDetail(for data: FocusData) {
        navigator.push(to: .Detail(data: data, session: nil))
    }
    
    func checkForLastSession() {
        guard let sessionId = UserDefaultsUtil.shared.getLastSessionID() else { return }
        
        let fetchDescriptor = FetchDescriptor<FocusSession>()
        do {
            if let session = try context.fetch(fetchDescriptor).first(where: { $0.id == sessionId }),
               let focus = homeDataSource.data.first(where: { $0.focus.id == session.focusId }) {
                navigator.push(to: .Detail(data: focus, session: session))
            }
        } catch {
            print("Error fetching sessionId: \(error)")
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
