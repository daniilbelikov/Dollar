//
//  TabViewColor.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

struct TabViewColor: ViewModifier {
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(AppColor.Common.navigationBar)
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    func body(content: Content) -> some View {
        content
    }
    
}
