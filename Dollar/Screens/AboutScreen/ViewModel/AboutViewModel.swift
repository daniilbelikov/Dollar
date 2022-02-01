//
//  AboutViewModel.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import UIKit

final class AboutViewModel: ObservableObject {
    
    func openWebSite() {
        if let url = URL(string: "https://belikov.dev"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
