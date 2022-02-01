//
//  AppColor.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

enum AppColor {
    
    enum Common {
        // light: hex #F4AA3A
        @DynamicColor(light: .init(red: 244/255, green: 170/255, blue: 58/255, alpha: 1)) static var tint
        
        // light: hex #0D0D0D
        @DynamicColor(light: .init(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)) static var background
        
        // light: hex #1F1F1F
        @DynamicColor(light: .init(red: 31/255, green: 31/255, blue: 31/255, alpha: 1)) static var navigationBar
        
        // light: hex #FFFFFF
        @DynamicColor(light: .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)) static var whiteText
        
        // light: hex #E6E6E6
        @DynamicColor(light: .init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)) static var grayText
    }
    
}
