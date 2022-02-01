//
//  CoursesViewModel.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation
import Services

final class CoursesViewModel: ObservableObject {
    
    @Published var courses = [CourseCellModel]()
    @Published var hasAppeared = false
    @Published var isLoading = false
    @Published var xmlDate = ""
    
    let coursesMapper: CoursesMapperProtocol
    let coursesService: CoursesServiceProtocol
    
    init(coursesMapper: CoursesMapperProtocol,
         coursesService: CoursesServiceProtocol) {
        
        self.coursesMapper = coursesMapper
        self.coursesService = coursesService
    }
    
}

// MARK: - Main API Method

extension CoursesViewModel {
    
    func getCourses(date: Date?) {
        hasAppeared = true
        isLoading = true
        
        coursesService.getCourses(onDate: date) { [weak self] result, xmlDate in
            guard let self = self else { return }
            
            if let stateModel = self.coursesMapper.parse(result: result) {
                self.courses = stateModel
                self.xmlDate = xmlDate
                self.isLoading = false
            }
        }
    }
    
}
