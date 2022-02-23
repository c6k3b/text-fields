//
//  LinkTextFieldView.swift
//  TextFields
//
//  Created by A A on 04.10.2021.
//

import UIKit
import SafariServices

class LinkTextFieldView: CustomTextFieldView {
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
        var keyWindow: UIWindow? {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })?.windows
                .first(where: \.isKeyWindow)
        }
        
        if let url = URL(string: TextFieldValidation().validateUrlString(sender.text!)),
           let viewController = keyWindow?.rootViewController {
            viewController.present(SFSafariViewController(url: url), animated: true)
        } else { return }
    }
}
