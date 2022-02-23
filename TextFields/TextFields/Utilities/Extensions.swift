//
//  Extensions.swift
//  TextFields
//
//  Created by A A on 10.10.2021.
//

import Foundation
import UIKit

extension String {
    func matchesPattern(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
            let range = NSRange(location: 0, length: count)
            let matches = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: range)
            return matches.count > 0
        } catch _ {
            return false
        }
    }
}
