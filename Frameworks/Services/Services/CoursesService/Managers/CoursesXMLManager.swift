//
//  CoursesXMLManager.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import Foundation

class CoursesXMLManager: NSObject {
    
    private var courses = [CoursesModel]()
    private var xmlDate = XMLDate()
    private var xmlData = XMLData()
    private var currentValue = ""
    
}

// MARK: - Write and Parse Data

extension CoursesXMLManager {
    
    func parseXMLData(data: Data,
                      completion: @escaping ((Result<[CoursesModel], Error>), String) -> Void) {
        
        writeDataToXML(data: data)
        parseDataFromURL(data: data,
                         completion: completion)
    }
    
}

// MARK: - Delegate Methods

extension CoursesXMLManager: XMLParserDelegate {
    
    public func parser(_ parser: XMLParser,
                       didStartElement elementName: String,
                       namespaceURI: String?,
                       qualifiedName qName: String?,
                       attributes attributeDict: [String: String] = [:]) {
        
        guard let element = HeaderElements(rawValue: elementName) else { return }
        
        switch element {
        case .valute:
            xmlData = XMLData()
        case .valCurs:
            xmlDate.value = attributeDict["Date"] ?? ""
        }
    }
    
    public func parser(_ parser: XMLParser,
                       didEndElement elementName: String,
                       namespaceURI: String?,
                       qualifiedName qName: String?) {
        
        guard let element = BodyElements(rawValue: elementName) else { return }
        
        switch element {
        case .numcode:
            xmlData.numCode = currentValue
        case .charcode:
            xmlData.charCode = currentValue
        case .nominal:
            xmlData.nominal = currentValue
            xmlData.nominalDouble = Double(currentValue.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        case .name:
            xmlData.name = currentValue
        case .value:
            xmlData.value = currentValue
            xmlData.valueDouble = Double(currentValue.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        case .valute:
            courses.append(CoursesModel(numCode: xmlData.numCode,
                                        charCode: xmlData.charCode,
                                        nominal: xmlData.nominal,
                                        nominalDouble: xmlData.nominalDouble,
                                        name: xmlData.name,
                                        value: xmlData.value,
                                        valueDouble: xmlData.valueDouble))
        }
    }
    
    public func parser(_ parser: XMLParser,
                       foundCharacters string: String) {
        
        currentValue = string
    }
    
}

// MARK: - Convert Data to CoursesModel

private extension CoursesXMLManager {
    
    var pathForXMLDocument: String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/data.xml"
        
        if FileManager.default.fileExists(atPath: path) {
            return path
        }
        
        if let result = Bundle(identifier: "dev.belikov.Services")?
            .path(forResource: "data", ofType: "xml") {
            return result
        }
        
        return ""
    }
    
    var urlForXMLDocument: URL {
        return URL(fileURLWithPath: pathForXMLDocument)
    }
    
    func writeDataToXML(data: Data) {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/data.xml"
        
        let urlForSave = URL(fileURLWithPath: path)
        
        do {
            try data.write(to: urlForSave)
            courses.removeAll()
        } catch {
            print("Error when save data: \(error.localizedDescription)")
        }
    }
    
    func parseDataFromURL(data: Data,
                          completion: @escaping ((Result<[CoursesModel], Error>), String) -> Void) {
        
        if let parser = XMLParser(contentsOf: urlForXMLDocument) {
            parser.delegate = self
            parser.parse()
            
            DispatchQueue.main.async {
                completion(.success(self.courses), self.xmlDate.value)
            }
        }
    }
    
}

// MARK: - Data Types

private extension CoursesXMLManager {
    
    class XMLDate {
        var value = ""
    }
    
    class XMLData {
        var numCode = ""
        var charCode = ""
        var nominal = ""
        var nominalDouble = 0.0
        var name = ""
        var value = ""
        var valueDouble = 0.0
    }
    
    enum HeaderElements: String {
        case valute = "Valute"
        case valCurs = "ValCurs"
    }
    
    enum BodyElements: String {
        case numcode = "NumCode"
        case charcode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case valute = "Valute"
    }
    
}
