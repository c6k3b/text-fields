//
//  OnlyCharactersTextFieldView.swift
//  TextFields
//
//  Created by A A on 03.10.2021.
//

import UIKit

class OnlyCharactersTextFieldView: CustomTextFieldView {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTextField(textField: textField)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupTextField(textField: textField)
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            textField.text = TextFieldValidation().validateWithMask(input: updatedText)
        }
        return false
    }
}
