//
//  Constants.swift
//  TextFields
//
//  Created by A A on 10.10.2021.
//

import UIKit

enum Styles {
    enum Size {
        static func textFieldLeftMargin() -> CGFloat { return 10 }
        
        enum BorderFrameSize {
            static func zeroWidth() -> CGFloat { return 0 }
            static func defaultWidth() -> CGFloat { return 0.8 }
        }
        
        enum TextFieldFrame {
            static func leftViewMargin(_ textField: UITextField) -> UIView {
                return UIView(frame: CGRect(x: 0, y: 0, width: Size.textFieldLeftMargin(), height: textField.frame.height))
            }
        }
    }
     
    enum Color {
        enum TextFieldBorderColor {
            static func colorBlue() -> CGColor { return UIColor.systemBlue.cgColor }
            static func colorRed() -> CGColor { return UIColor.systemRed.cgColor }
        }
        
        enum TextColor {
            static func colorRed() -> UIColor { return UIColor.systemRed }
            static func colorBlack() -> UIColor { return UIColor.black }
        }
        
        enum RulesListColor {
            static func colorBlack() -> UIColor { return UIColor.black }
            static func colorGreen() -> UIColor { return UIColor.systemGreen }
        }
        
        enum ProgressViewColor {
            static func colorRed() -> UIColor { return UIColor.systemRed }
            static func colorOrange() -> UIColor { return UIColor.systemOrange }
            static func colorYellow() -> UIColor { return UIColor.systemYellow }
            static func colorGreen() -> UIColor { return UIColor.systemGreen }
        }
    }
}
