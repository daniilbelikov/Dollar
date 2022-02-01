//
//  View+Customization.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

extension View {
    
    func setNavigationViewColor() -> some View {
        modifier(NavigationViewColor())
    }
    
    func setTabViewColor() -> some View {
        modifier(TabViewColor())
    }
    
}
