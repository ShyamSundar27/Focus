//
//  Font.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//


import SwiftUI

struct XFont {
    
    static func XBold(_ size: CGFloat) -> Font {
        Font.custom("Poppins-Bold", size: size)
    }
    
    static func XRegular(_ size: CGFloat) -> Font {
        Font.custom("Poppins-Regular", size: size)
    }
    
    static func XLight(_ size: CGFloat) -> Font {
        Font.custom("Poppins-Light", size: size)
    }
}
