//
//  TextFieldsTests.swift
//  TextFieldsTests
//
//  Created by A A on 10.10.2021.
//

import XCTest
@testable import TextFields

class TextFieldsTests: XCTestCase {
    let textFieldValidation = TextFieldValidation()
    
    // NO digits
    func testNoDigitsTextField() {
        let input = "String with 123 numbers"
        let output = textFieldValidation.checkIfNoDigits(input)
        XCTAssertEqual(output, "String with  numbers")
    }
    
    // Input Mask
    func testOnlyCharactersTextField() {
        let input = "abcde 12345"
        let output = textFieldValidation.validateWithMask(input: input)
        XCTAssertEqual(output, "abcde-12345")
    }
    
    func testOnlyCharactersTextField2() {
        let input = "abcdeabcde"
        let output = textFieldValidation.validateWithMask(input: input)
        XCTAssertEqual(output, "abcde-")
    }
    
    func testOnlyCharactersTextField3() {
        let input = "11111"
        let output = textFieldValidation.validateWithMask(input: input)
        XCTAssertEqual(output, "")
    }
    
    func testOnlyCharactersTextField4() {
        let input = "aaaaa-aaaaa"
        let output = textFieldValidation.validateWithMask(input: input)
        XCTAssertEqual(output, "aaaaa-")
    }
    
    // Validate Url
    func testValidateUrlString() {
        let input = "Ya.ru"
        let output = textFieldValidation.validateUrlString(input)
        XCTAssertEqual(output, "http://ya.ru")
    }
    
    func testValidateUrlString2() {
        let input = "Ya"
        let output = textFieldValidation.validateUrlString(input)
        XCTAssertEqual(output, "")
    }
    
    func testValidateUrlString3() {
        let input = "Ya,t"
        let output = textFieldValidation.validateUrlString(input)
        XCTAssertEqual(output, "")
    }
    
    func testValidateUrlString4() {
        let input = "www.ya.ru"
        let output = textFieldValidation.validateUrlString(input)
        XCTAssertEqual(output, "http://www.ya.ru")
    }
}
