//
//  CourseMapperProtocol.swift
//  Dollar
//
//  Created by Daniil Belikov on 10.08.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

protocol CoursesMapperProtocol {
    func parse(result: Result<[CourseModel], Error>) -> [CourseCellModel]?
    
}
