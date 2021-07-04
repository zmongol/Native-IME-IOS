//
//  CVCell+Extension.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 09.04.2021.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind supplementaryViewOfKind: String) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableView<T: UICollectionReusableView>(elementKind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
