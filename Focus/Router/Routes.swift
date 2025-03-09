//
//  Routes.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

enum Routes: Hashable {
    case Detail(data: FocusData, session: FocusSession?)
    case Profile
    case Add
    case RecentSessions
}

extension Routes: View {
    var body: some View {
        switch self {
        case .Detail(let data, let session):
            FocusDetailView(vm: FocusDetailViewModel(data: data, existingSession: session))
                .navigationBarBackButtonHidden(true)
        case .Profile:
            ProfileView()
        case .Add:
            AddFocusView()
        case .RecentSessions:
            RecentSessionsView()
        }
    }
}
