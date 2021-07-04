//
//  UIViewLoadFromXib+Extension.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

extension UIView {
    static func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    static func loadFromNib() -> UIView? {
        return loadFromNibNamed(classsName())
    }
    
    static func nibForView() -> UINib {
        return UINib(nibName: classsName(), bundle: nil)
    }
    
    fileprivate static func classsName() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
