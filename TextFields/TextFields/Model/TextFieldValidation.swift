//
//  TextFieldsModel.swift
//  TextFields
//
//  Created by A A on 10.10.2021.
//

import Foundation

struct TextFieldValidation {
    // Filtered input
    func checkIfNoDigits(_ string: String) -> String {
        return string.components(separatedBy: CharacterSet.decimalDigits).joined()
    }
    
    // Mask
    func validateWithMask(input: String) -> String {
        let inputSet = input.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        let mask = "*****-#####"
        var result = ""
        var index = inputSet.startIndex
        
        for char in mask where index < inputSet.endIndex {
            if char == "#" {
                if inputSet[index].isNumber { result.append(inputSet[index]) }
                index = inputSet.index(after: index)
            } else if char == "*" {
                if inputSet[index].isLetter { result.append(inputSet[index]) }
                index = inputSet.index(after: index)
            } else { result.append(char) }
        }
        return result
    }
    
    // URL
    func validateUrlString(_ urlFromString: String) -> String {
        let urlValidationRegex = "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"
        var validatedUrl = urlFromString.lowercased()
        
        addUrlHead(&validatedUrl)
        
        if validatedUrl.matchesPattern(pattern: urlValidationRegex) {
            return validatedUrl
        } else {
            return ""
        }
    }
    
    private func addUrlHead(_ validatedUrl: inout String) {
        if validatedUrl.starts(with: "http://") == false {
            validatedUrl = "http://" + validatedUrl
        }
    }
}
