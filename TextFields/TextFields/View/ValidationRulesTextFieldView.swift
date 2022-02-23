//
//  ValidationRulesTextFieldView.swift
//  TextFields
//
//  Created by A A on 04.10.2021.
//

import UIKit

class ValidationRulesTextFieldView: CustomTextFieldView {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var minLengthLabel: UILabel!
    @IBOutlet weak var minOneDigitLabel: UILabel!
    @IBOutlet weak var minOneLowercaseLabel: UILabel!
    @IBOutlet weak var minOneCapitalLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTextField(textField: textField)
        progressView.trackTintColor = .clear
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupTextField(textField: textField)
        progressView.trackTintColor = .clear
    }
    
    // MARK: - Actions
    @IBAction func textFieldAction(_ sender: UITextField) {
        validatePasswordRules()
        setProgress()
        setProgressViewColor()
    }
    
    // MARK: - Private Methods
    
    // Validation rules
    private func validatePasswordRules() {
        checkMinLength()
        checkDecimalDigits()
        checkLowercaseLetters()
        checkUppercaseLetters()
    }
    
    private func checkMinLength() {
        if textField.text!.count > 7 {
            minLengthLabel.text = "✓ Min length 8 characters"
            minLengthLabel.textColor = Styles.Color.RulesListColor.colorGreen()
        } else {
            minLengthLabel.text = "-   Min length 8 characters"
            minLengthLabel.textColor = Styles.Color.RulesListColor.colorBlack()
        }
    }
    
    private func checkDecimalDigits() {
        if textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
            minOneDigitLabel.text = "✓ Min 1 digit,"
            minOneDigitLabel.textColor = Styles.Color.RulesListColor.colorGreen()
        } else {
            minOneDigitLabel.text = "-   Min 1 digit,"
            minOneDigitLabel.textColor = Styles.Color.RulesListColor.colorBlack()
        }
    }
    
    private func checkLowercaseLetters() {
        if textField.text?.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil {
            minOneLowercaseLabel.text = "✓ Min 1 lowercase,"
            minOneLowercaseLabel.textColor = Styles.Color.RulesListColor.colorGreen()
        } else {
            minOneLowercaseLabel.text = "-   Min 1 lowercase,"
            minOneLowercaseLabel.textColor = Styles.Color.RulesListColor.colorBlack()
        }
    }
    
    private func checkUppercaseLetters() {
        if textField.text?.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil {
            minOneCapitalLabel.text = "✓ Min 1 capital required"
            minOneCapitalLabel.textColor = Styles.Color.RulesListColor.colorGreen()
        } else {
            minOneCapitalLabel.text = "-   Min 1 capital required"
            minOneCapitalLabel.textColor = Styles.Color.RulesListColor.colorBlack()
        }
    }
    
    // Progress view setup
    private func setProgress() {
        var progress: Float = 0
        if minLengthLabel.textColor == Styles.Color.RulesListColor.colorGreen() { progress += 0.25 }
        if minOneDigitLabel.textColor == Styles.Color.RulesListColor.colorGreen() { progress += 0.25 }
        if minOneLowercaseLabel.textColor == Styles.Color.RulesListColor.colorGreen() { progress += 0.25 }
        if minOneCapitalLabel.textColor == Styles.Color.RulesListColor.colorGreen() { progress += 0.25 }
        progressView.progress = progress
    }
    
    private func setProgressViewColor() {
        if progressView.progress == 0.25 { progressView.progressTintColor = Styles.Color.ProgressViewColor.colorRed() }
        if progressView.progress == 0.5 { progressView.progressTintColor = Styles.Color.ProgressViewColor.colorOrange() }
        if progressView.progress == 0.75 { progressView.progressTintColor = Styles.Color.ProgressViewColor.colorYellow() }
        if progressView.progress == 1 { progressView.progressTintColor = Styles.Color.ProgressViewColor.colorGreen() }
    }
}
