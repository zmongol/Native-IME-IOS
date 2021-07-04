//
//  LoadableView+Extension.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
    static func fromNib() -> Self
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }

    static func fromNib() -> Self {
        return loadFromNibNamed(nibName)!
    }

    private static func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> Self? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? Self
    }
}

// MARK: - ReusableView

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}
