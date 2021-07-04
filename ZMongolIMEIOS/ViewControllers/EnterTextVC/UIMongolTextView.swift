//
//  VerticalTypingTextView.swift
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 14.04.2021.
//

import UIKit

class UITextViewWithoutMenu: UITextView {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return false
    }
}


@IBDesignable class UIMongolTextView: UIView {
    
    // FIXME: long load time
    
    // MARK:- Unique to TextView
    
    // ********* Unique to TextView *********
    fileprivate var view = UITextViewWithoutMenu()
    fileprivate let rotationView = UIView()
    fileprivate var userInteractionEnabledForSubviews = true
    
    @IBInspectable var text: String {
        get {
            return view.text
        }
        set {
            view.text = newValue
        }
    }
    
    @IBInspectable var centerText: Bool {
        get {
            return view.textAlignment == NSTextAlignment.center
        }
        set {
            if newValue {
                view.textAlignment = NSTextAlignment.center
            }
        }
    }
    
    @IBInspectable var editable: Bool {
        get {
            return view.isEditable
        }
        set {
            view.isEditable = newValue
        }
    }
    
    @IBInspectable var selectable: Bool {
        get {
            return view.isSelectable
        }
        set {
            view.isSelectable = newValue
        }
    }
    
    var scrollEnabled: Bool {
        get {
            return view.isScrollEnabled
        }
        set {
            view.isScrollEnabled = newValue
        }
    }
    
    var attributedText: NSAttributedString! {
        get {
            return view.attributedText
        }
        set {
            view.attributedText = newValue
        }
    }
    
    var contentSize: CGSize {
        get {
            return CGSize(width: view.contentSize.height, height: view.contentSize.width)
        }
        set {
            view.contentSize = CGSize(width: newValue.height, height: newValue.width)
        }
    }
    
    
    
    var underlyingTextView: UITextViewWithoutMenu {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    // TODO: Switch the sides to account for rotation
    var textContainerInset: UIEdgeInsets {
        get {
            return view.textContainerInset
        }
        set {
            view.textContainerInset = newValue
        }
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: view.frame.height, height: view.frame.width)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // swap the length and width coming in and going out
        let fitSize = view.sizeThatFits(CGSize(width: size.height, height: size.width))
        return CGSize(width: fitSize.height, height: fitSize.width)
    }
    
    
    func setup() {
        // 1-10: ᠨᠢᠭᠡ ᠬᠤᠶᠠᠷ ᠭᠤᠷᠪᠠ ᠳᠦᠷᠪᠡ ᠲᠠᠪᠤ ᠵᠢᠷᠭᠤᠭ᠎ᠠ ᠳᠤᠯᠤᠭ᠎ᠠ ᠨᠠᠢ᠌ᠮᠠ ᠶᠢᠰᠦ ᠠᠷᠪᠠ
        
        // FIXME: UI related settings should go in LayoutSubviews
        //view.backgroundColor = UIColor.red
        rotationView.isUserInteractionEnabled = userInteractionEnabledForSubviews
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.becomeFirstResponder()
        
        self.addSubview(rotationView)
        rotationView.addSubview(view)
        
        // add constraints to pin TextView to rotation view edges.
        let leadingConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        
        rotationView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
        view.font = UIFont(name: "Z52HaraTigMirror", size: 26)
        view.textColor = .black
        
    }
    
    func setSmallFont(textColor: UIColor) {
        view.font = UIFont(name: "Z52HaraTigMirror", size: 20)
        setTextColor(textColor: textColor)
    }
    
    func setFont(size: CGFloat) {
        view.font = UIFont(name: "Z52HaraTigMirror", size: size)
    }
    
    func setTextColor(textColor: UIColor) {
        view.textColor = textColor
    }
    
    
    // MARK:- General code for Mongol views
    
    // *******************************************
    // ****** General code for Mongol views ******
    // *******************************************
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rotationView.transform = CGAffineTransform.identity
        rotationView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.bounds.height, height: self.bounds.width))
        rotationView.transform = translateRotateFlip()
        
        if self.view.text.isEmpty == false {
            self.view.scrollRangeToVisible(NSMakeRange(0, 1))
        }
    }
    
    func translateRotateFlip() -> CGAffineTransform {
        
        var transform = CGAffineTransform.identity
        
        // translate to new center
        transform = transform.translatedBy(x: (self.bounds.width / 2)-(self.bounds.height / 2), y: (self.bounds.height / 2)-(self.bounds.width / 2))
        // rotate counterclockwise around center
        transform = transform.rotated(by: CGFloat(-Double.pi/2))
        // flip vertically
        transform = transform.scaledBy(x: -1, y: 1)
        
        return transform
    }
}
