//
//  TimerView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct TimerView: View {
    @Binding var currentTime: String
    var body: some View {
        Text(currentTime)
            .foregroundStyle(.black)
            .font(XFont.XBold(40))
    }
}
