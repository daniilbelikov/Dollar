//
//  DynamicColor.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

@propertyWrapper
struct DynamicColor {
    let light: UIColor
    let dark: UIColor?
    
    var wrappedValue: Color {
        let color = UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark ?? light
            case .light, .unspecified:
                return light
            @unknown default:
                return light
            }
        }
        return Color(color)
    }
    
    init(light: UIColor,
         dark: UIColor? = nil) {
        
        self.light = light
        self.dark = dark
    }
    
}
