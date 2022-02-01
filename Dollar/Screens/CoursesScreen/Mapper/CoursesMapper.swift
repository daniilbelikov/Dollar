//
//  CoursesMapper.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation
import Services

class CoursesMapper: CoursesMapperProtocol {
    
    private func getCharCode(_ course: CoursesModel) -> String {
        if let charCode = course.charCode {
            return charCode
        }
        return ""
    }
    
    private func getCurrencyName(_ course: CoursesModel) -> String {
        if let name = course.name {
            return name
        }
        return ""
    }
    
    private func getMoneyValue(_ course: CoursesModel) -> String {
        if let valueDouble = course.valueDouble,
           let nominalDouble = course.nominalDouble {
            
            let labelCourseText = (valueDouble / nominalDouble)
            let doubleResult = (labelCourseText * 1000) / 1000
            let stringResult = String(format: "%.2f", doubleResult)
            let finalResult = stringResult + "₽"
            
            return finalResult
        }
        return "0.0"
    }
    
}

// MARK: - Main Parse Method

extension CoursesMapper {
    
    func parse(result: Result<[CoursesModel], Error>) -> [CourseCellModel]? {
        switch result {
        case .success(let data):
            let dataArray = data.map { course in
                return CourseCellModel(charCode: getCharCode(course),
                                       currencyName: getCurrencyName(course),
                                       moneyValue: getMoneyValue(course))
            }
            return dataArray
        case .failure(let error):
            print(error.localizedDescription)
            return nil
        }
    }
    
}
