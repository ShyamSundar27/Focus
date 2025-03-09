//
//  BadgeCountView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct BadgeCountView: View {
    @Binding var count: Int
    let icon: String  // Dynamic badge icon
    
    init(count: Binding<Int>, icon: String) {
        self._count = count
        self.icon = icon
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("\(count) x")
                .font(XFont.XBold(30))
            Text(icon) // Use dynamic icon
                .font(XFont.XRegular(60))
        }
    }
}
