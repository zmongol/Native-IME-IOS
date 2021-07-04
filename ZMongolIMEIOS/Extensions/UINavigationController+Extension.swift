//
//  UINavigationController+Extension.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

extension UINavigationController {
    func setClearBarBackground() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .clear
        navigationBar.isTranslucent = true
    }
    
    func setDefaultBarBackground() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = .black
        navigationBar.isTranslucent = false
    }
}

extension UINavigationController {
    func popTo(vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(vc, animated: animated)
        CATransaction.commit()
    }
}
