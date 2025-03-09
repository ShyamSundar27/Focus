//
//  HomeModel.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation
import SwiftUI
import SwiftData

struct FocusData: Hashable {
    let focus: Focus
    let FColor: Color
    let BColor: Color
    
    init(focus: Focus) {
            self.focus = focus
            switch focus.type {
            case .Work:
                FColor = XColor.Work
                BColor = XColor.WorkBG
            case .Personal:
                FColor = XColor.Personal
                BColor = XColor.PersonalBG
            case .Reading:
                FColor = XColor.Reading
                BColor = XColor.Reading
            case .Sleep:
                FColor = XColor.Sleep
                BColor = XColor.Sleep
            default:
                FColor = XColor.Custom
                BColor = XColor.CustomBG
            }
        }
}

struct DataSource {
    var data: [FocusData]
    var user: User?
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        DataInitializer.intializeFocusesIfNeeded(context: context)
        DataInitializer.initializeDefaultUser(context: context)
        self.data = DataInitializer.loadFocusDatas(context: context)
        self.user = DataInitializer.loadUser(context: context)
    }
    
    func focusMode(for name: String) -> FocusData? {
        return data.first { $0.focus.name == name }
    }
}

