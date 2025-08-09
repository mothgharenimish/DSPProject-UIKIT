//
//  Extension.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 08/08/25.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension UIView {
    
    func setCornerRadiusView(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}

extension UITextField{
    
    func setCornerRadiusTextField(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}


extension UIButton {
    
    func setCornerRadiusButton(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}
