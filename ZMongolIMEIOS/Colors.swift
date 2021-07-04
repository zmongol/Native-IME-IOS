//
//  Colors.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

class Colors {
    static func color(colorType: ColorType) -> UIColor {
        switch colorType {
        case .mainViolet:
            return #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        }
    }
}

enum ColorType {
    case mainViolet
}
