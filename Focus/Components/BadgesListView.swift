//
//  BadgesListView.swift
//  Focus
//
//  Created by shyam-15059 on 09/03/25.
//

import SwiftUI

struct BadgesListView: View {
    @Binding var groupedBadges: [String: Int]
    var backgroundColor: Color
    
    var body: some View {
        VStack {
            Text("Total Points: \(groupedBadges.values.reduce(0, +))")
                .font(XFont.XBold(24))
                .padding()
            List(Array(groupedBadges.keys), id: \.self) { icon in
                HStack {
                    Text("\(icon) x \(groupedBadges[icon] ?? 0)")
                        .font(XFont.XBold(30))
                }
                .padding(.vertical, 8)
                .listRowBackground(backgroundColor)
            }
            .scrollContentBackground(.hidden)
            .background(backgroundColor)
        }
        
    }
}
