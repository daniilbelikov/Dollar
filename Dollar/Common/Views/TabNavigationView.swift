//
//  TabNavigationView.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Services
import SwiftUI

struct TabNavigationView: View {
    
    var body: some View {
        TabView {
            CoursesView(courseViewModel: .init(coursesMapper: CoursesMapper(),
                                               coursesService: CoursesService()))
                .tabItem {
                    Image("tab1")
                        .renderingMode(.template)
                    Text("TABVIEW.COURSESVIEW.TITLE".localize())
                }
            AboutView(courseViewModel: .init())
                .tabItem {
                    Image("tab2")
                        .renderingMode(.template)
                    Text("TABVIEW.ABOUTVIEW.TITLE".localize())
                }
        }
        .setTabViewColor()
        .accentColor(AppColor.Common.tint)
    }
    
}

struct TabNavigationView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabNavigationView()
    }
    
}
