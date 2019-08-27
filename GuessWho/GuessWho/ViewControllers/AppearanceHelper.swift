//
//  AppearanceHelper.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation
import UIKit

enum AppearanceHelper {
    
    static var snowWhite = #colorLiteral(red: 1, green: 0.9882352941, blue: 0.9764705882, alpha: 1)
    static var sunny = #colorLiteral(red: 0.9411764706, green: 0.9647058824, blue: 0.431372549, alpha: 1)
    static var bergonia = #colorLiteral(red: 1, green: 0.4117647059, blue: 0.4705882353, alpha: 1)
    
    static func futuraFont(textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        let font = UIFont(name: "Futura", size: pointSize)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    static func styleButton(button: UIButton) {
        button.setTitleColor(snowWhite, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3
        button.layer.borderColor = sunny.cgColor
        button.backgroundColor = bergonia
    }
    
    
}
