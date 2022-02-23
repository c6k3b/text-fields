//
//  NoDigitsTextFieldView.swift
//  TextFields
//
//  Created by A A on 03.10.2021.
//

import UIKit

class NoDigitsTextFieldView: CustomTextFieldView {
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
    
    // MARK: - Actions
    @IBAction func textFieldAction(_ sender: UITextField) {
        textField.text = TextFieldValidation().checkIfNoDigits(sender.text ?? "")
    }
}
