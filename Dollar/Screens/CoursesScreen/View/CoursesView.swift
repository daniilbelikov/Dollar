//
//  ContentView.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Services
import SwiftUI

struct CoursesView: View {
    
    @StateObject private var viewModel: CoursesViewModel
    @State private var showCalendarView = false
    @State private var isAllowedRequest = false
    @State private var chosenDate = Date()
    
    init(courseViewModel: CoursesViewModel) {
        _viewModel = StateObject(wrappedValue: courseViewModel)
    }
    
    var body: some View {
        ZStack {
            AppColor.Common.background
                .ignoresSafeArea()
            
            NavigationView {
                List(viewModel.courses, id: \.id) { course in
                    CourseCell(courseCellModel: course)
                }
                .listStyle(PlainListStyle())
                .navigationTitle(Text("SCREENS.COURSESVIEW.TITLE".localize()))
                .navigationBarItems(leading: leadingText)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            showCalendarView.toggle()
                        }, label: {
                            Image("calendar")
                        })
                        .fullScreenCover(isPresented: $showCalendarView, onDismiss: {
                            if isAllowedRequest {
                                viewModel.getCourses(date: chosenDate)
                            }
                        }) {
                            CalendarView(isAllowedRequest: $isAllowedRequest,
                                         chosenDate: $chosenDate)
                        }
                        
                        Button(action: {
                            viewModel.getCourses(date: nil)
                        }, label: {
                            Image("refresh")
                        })
                    }
                })
            }
            .setNavigationViewColor()
            .onAppear {
                if !viewModel.hasAppeared {
                    viewModel.getCourses(date: nil)
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
    
    private var leadingText: some View {
        Text(viewModel.xmlDate)
            .foregroundColor(AppColor.Common.grayText)
            .fontWeight(.regular)
    }
    
}

struct CoursesView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoursesView(courseViewModel: .init(coursesMapper: CoursesMapper(),
                                           coursesService: CoursesService()))
    }
    
}
