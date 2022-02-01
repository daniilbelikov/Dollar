//
//  AboutView.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @StateObject private var viewModel: AboutViewModel
    
    init(courseViewModel: AboutViewModel) {
        _viewModel = StateObject(wrappedValue: courseViewModel)
    }
    
    var body: some View {
        ZStack {
            AppColor.Common.background
                .ignoresSafeArea()
            
            NavigationView {
                VStack {
                    developerPhoto
                    nameTitle
                    platformSubtitle
                    description
                    hirebutton
                }
                .navigationBarTitle("SCREENS.ABOUTVIEW.TITLE".localize(),
                                    displayMode: .large)
            }
            .setNavigationViewColor()
        }
    }
    
    private var developerPhoto: some View {
        Image("developer")
            .resizable()
            .frame(width: 150.0,
                   height: 150.0)
            .clipShape(RoundedRectangle(cornerRadius: 100.0))
    }
    
    private var nameTitle: some View {
        Text("SCREENS.ABOUTVIEW.TEXT.TITLE".localize())
            .foregroundColor(AppColor.Common.whiteText)
            .font(.system(size: 26.0,
                          weight: .bold))
            .padding(EdgeInsets(top: 10.0,
                                leading: 0.0,
                                bottom: 0.0,
                                trailing: 0.0))
    }
    
    private var platformSubtitle: some View {
        Text("SCREENS.ABOUTVIEW.TEXT.SUBTITLE".localize())
            .foregroundColor(AppColor.Common.grayText)
            .font(.system(size: 16.0,
                          weight: .semibold))
            .padding(EdgeInsets(top: 0.0,
                                leading: 0.0,
                                bottom: 0.0,
                                trailing: 0.0))
    }
    
    private var description: some View {
        Text("SCREENS.ABOUTVIEW.TEXT.DESCRIPTION".localize())
            .foregroundColor(AppColor.Common.whiteText)
            .font(.system(size: 14.0,
                          weight: .regular))
            .padding(EdgeInsets(top: 10.0,
                                leading: 20.0,
                                bottom: 18.0,
                                trailing: 20.0))
    }
    
    private var hirebutton: some View {
        Button(action: {
            viewModel.openWebSite()
        }) {
            HStack {
                Text("SCREENS.ABOUTVIEW.BUTTON".localize())
                    .fontWeight(.semibold)
                    .font(.callout)
                    .foregroundColor(AppColor.Common.whiteText)
            }
            .frame(minWidth: 0.0,
                   maxWidth: 340.0)
            .padding(EdgeInsets(top: 14.0,
                                leading: 0.0,
                                bottom: 14.0,
                                trailing: 0.0))
            .background(AppColor.Common.tint)
            .foregroundColor(AppColor.Common.whiteText)
            .cornerRadius(16.0)
        }
    }
    
}

struct AboutView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutView(courseViewModel: .init())
    }
    
}
