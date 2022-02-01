//
//  CoursesRemoteManager.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

class CoursesRemoteManager {
    
    private var urlAddress = CBRAddress()
    
}

// MARK: - Request Courses on Date

extension CoursesRemoteManager {
    
    var scheme: String {
        return urlAddress.scheme
    }
    
    var host: String {
        return urlAddress.host
    }
    
    var path: String {
        return urlAddress.path
    }
    
    func requestDataFromURL(onDate date: Date?,
                            completion: @escaping (Data) -> Void) {
        
        var urlAddress = scheme + host + path
        
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            urlAddress = urlAddress + dateFormatter.string(from: date)
        }
        
        if let url = URL(string: urlAddress) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                completion(data)
            }.resume()
        }
    }
    
}

// MARK: - Parts of API

private extension CoursesRemoteManager {
    
    class CBRAddress {
        var scheme = "http://"
        var host = "www.cbr.ru"
        var path = "/scripts/XML_daily.asp?date_req="
    }
    
}
