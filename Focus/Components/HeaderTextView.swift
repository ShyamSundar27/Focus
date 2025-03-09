//
//  HeaderTextView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct HeaderTextView: View {
    let prefixText: String
    let highlightText: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(prefixText) ")
                .font(XFont.XLight(38))
                .foregroundColor(.gray)
            
            Text(highlightText)
                .font(XFont.XLight(38))
                .foregroundColor(.black)
        }
    }
}

//#Preview {
//    HeaderTextView()
//}
