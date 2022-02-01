//
//  CoursesMapperProtocol.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation
import Services

protocol CoursesMapperProtocol {
    func parse(result: Result<[CoursesModel], Error>) -> [CourseCellModel]?
    
}
