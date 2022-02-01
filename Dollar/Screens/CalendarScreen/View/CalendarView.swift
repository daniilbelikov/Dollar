//
//  CalendarView.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @Binding var isAllowedRequest: Bool
    @Binding var chosenDate: Date
    
    var onDismiss: (() -> Void)?
    
    var body: some View {
        ZStack {
            AppColor.Common.background
                .ignoresSafeArea()
            
            NavigationView {
                VStack {
                    datePicker
                    acceptButton
                }
                .navigationBarTitle("SCREENS.CALENDARVIEW.TITLE".localize(),
                                    displayMode: .inline)
                .navigationBarItems(leading: leadingButton)
            }
            .setNavigationViewColor()
        }
    }
    
    private var datePicker: some View {
        DatePicker(selection: $chosenDate,
                   in: ...Date(),
                   displayedComponents: .date) {
        }
        .datePickerStyle(GraphicalDatePickerStyle())
        .accentColor(AppColor.Common.tint)
    }
    
    private var acceptButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            isAllowedRequest = true
        }) {
            HStack {
                Text("SCREENS.CALENDARVIEW.TEXT.CHOICE".localize())
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
    
    private var leadingButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            isAllowedRequest = false
        }, label: {
            Text("SCREENS.CALENDARVIEW.TEXT.BACK".localize())
                .fontWeight(.regular)
                .accentColor(AppColor.Common.tint)
        })
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalendarView(isAllowedRequest: .constant(false),
                     chosenDate: .constant(Date()))
    }
    
}
