//
//  CoursesService.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

public class CoursesService: CoursesServiceProtocol {
    
    let remoteManager = CoursesRemoteManager()
    let xmlManager = CoursesXMLManager()
    
    public init() {}
}

// MARK: - Request and Parse Data to XML

extension CoursesService {
    
    public func getCourses(onDate date: Date?,
                           completion: @escaping ((Result<[CoursesModel], Error>), String) -> Void) {
        
        remoteManager.requestDataFromURL(onDate: date) { data in
            self.xmlManager.parseXMLData(data: data,
                                         completion: completion)
        }
    }
    
}
