//
//  String+Localization.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

extension String {
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
