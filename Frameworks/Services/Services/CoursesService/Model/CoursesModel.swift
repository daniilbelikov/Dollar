//
//  CoursesModel.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

public struct CoursesModel {
    public let numCode: String?
    public let charCode: String?
    public let nominal: String?
    public let nominalDouble: Double?
    public let name: String?
    public let value: String?
    public let valueDouble: Double?
    
    public init(numCode: String?,
                charCode: String?,
                nominal: String?,
                nominalDouble: Double?,
                name: String?,
                value: String?,
                valueDouble: Double?) {
        
        self.numCode = numCode
        self.charCode = charCode
        self.nominal = nominal
        self.nominalDouble = nominalDouble
        self.name = name
        self.value = value
        self.valueDouble = valueDouble
    }
    
}
