//
//  BadgeCategoryHelper.swift
//  Focus
//
//  Created by shyam-15059 on 09/03/25.
//

import Foundation

struct BadgeCategoryHelper {
    static func category(for icon: String) -> BadgeCategory? {
        for category in BadgeCategory.allCases {
            if category.badgeIcon.contains(icon) {
                return category
            }
        }
        return nil
    }
}
