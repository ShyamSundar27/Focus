//
//  ProfileIcon.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//

import SwiftUI

struct ProfileIcon: View {
    
    @ObservedObject var user: User
    
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40, height: 40)
                .offset(x:-1)
                .foregroundStyle(Gradient(colors: [.cyan, .white]))
            Group {
                if let photoData = user.photo, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                } else {
                    Image(.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(20)
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    ProfileIcon(user: <#User#>)
//}
