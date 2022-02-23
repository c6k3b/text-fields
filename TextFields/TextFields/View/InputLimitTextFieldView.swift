//
//  InputLimitTextView.swift
//  TextFields
//
//  Created by A A on 03.10.2021.
//

import UIKit

class InputLimitTextFieldView: CustomTextFieldView {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var countSymbolsLabel: UILabel!
    
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
        let symbolsLimit = 10
        let symbolsCounter = symbolsLimit - sender.text!.count
        
        countSymbolsLabel.text = "\(symbolsCounter)"
        
        if symbolsCounter < 0 {
            textField.layer.borderColor = Styles.Color.TextFieldBorderColor.colorRed()
            // Colorizing symbols
            let attributedString = NSMutableAttributedString(string: sender.text!)
            attributedString.addAttribute(.foregroundColor, value: Styles.Color.TextColor.colorRed(), range: NSRange(location: symbolsLimit, length: attributedString.length - symbolsLimit))
            textField.attributedText = attributedString
        } else {
            textField.layer.borderColor = Styles.Color.TextFieldBorderColor.colorBlue()
            countSymbolsLabel.textColor = Styles.Color.TextColor.colorBlack()
            textField.textColor = Styles.Color.TextColor.colorBlack()
        }
    }
}
