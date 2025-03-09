//
//  FocusCard.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct FocusCard: View {
    @State var data: FocusData
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    data.FColor
                        .cornerRadius(12)
                    Image(systemName: data.focus.iconName)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .frame(width: 60, height: 60)
                
                Text(data.focus.name)
                    .font(XFont.XLight(22))
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                Spacer()
            }
            
        }
        .frame(height: 50)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(data.BColor)
        )
    }
}
