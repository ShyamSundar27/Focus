//
//  AddButton.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        HStack(alignment: .center, content: {
            Spacer()
            Image(systemName: "plus")
                .font(XFont.XLight(20))
                .padding(.vertical, 25)
            Spacer()
        })
        .background(XColor.CustomBG)
        .foregroundStyle(.black)
        .cornerRadius(25)
    }
}

#Preview {
    AddButton()
}
