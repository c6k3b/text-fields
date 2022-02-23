//
//  CustomTextFieldView.swift
//  TextFields
//
//  Created by A A on 11.10.2021.
//

import UIKit

class CustomTextFieldView: UIView {
    func setupView() {
        let view = viewFromNib()
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
    }
    
    func viewFromNib() -> UIView {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    func setupTextField(textField: UITextField) {
        textField.delegate = self
        textField.leftView = Styles.Size.TextFieldFrame.leftViewMargin(textField)
        textField.leftViewMode = .always
    }
}

// MARK: - TextFieldDelegates
extension UIView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.layer.borderWidth = Styles.Size.BorderFrameSize.zeroWidth()
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Styles.Color.TextFieldBorderColor.colorBlue()
        textField.layer.borderWidth = Styles.Size.BorderFrameSize.defaultWidth()
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = Styles.Size.BorderFrameSize.zeroWidth()
    }
}
