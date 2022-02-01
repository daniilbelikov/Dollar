//
//  CoursesServiceProtocol.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

public protocol CoursesServiceProtocol {
    func getCourses(onDate: Date?, completion: @escaping ((Result<[CoursesModel], Error>), String) -> Void)
    
}
