//
//  ActionButton.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct ActionButton: View {
    @Binding var buttonState: ButtonStates
    var body: some View {
        HStack(alignment: .center, content: {
            Spacer()
            Text(buttonState.rawValue)
                .font(XFont.XLight(20))
                .padding(.vertical, 25)
            Spacer()
        })
        .background(.black)
        .foregroundStyle(.white)
        .cornerRadius(25)
    }
}

