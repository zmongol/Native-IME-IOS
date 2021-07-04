//
//  EnterTextVC.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

class EnterTextVC: BaseVC {
    @IBOutlet fileprivate var mongolTextView: UIMongolTextView!
    @IBOutlet fileprivate var bottomTextViewConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: "Z52HaraTigMirror", size: 16)
            let transform = CGAffineTransform.identity
            titleLabel.transform = transform.scaledBy(x: 1, y: -1)
        }
    }
    
    var sqliteHelper = SQLiteHelper()
    var userInterfaceStyle: UIUserInterfaceStyle?
    
    override func keyboardWillShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame: NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        bottomTextViewConstraint.constant = keyboardHeight - view.safeAreaInsets.bottom + 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mongolTextView.setup()
        userInterfaceStyle = self.traitCollection.userInterfaceStyle
        setupUI()
        
        for family: String in UIFont.familyNames {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setupUI()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        userInterfaceStyle = newCollection.userInterfaceStyle
    }

    private func setupUI() {
        switch userInterfaceStyle {
        case .dark:
            setupViewStyle(isDark: true)
        case .light:
            setupViewStyle(isDark: false)
        default:
            break
        }
    }
    
    fileprivate func setupViewStyle(isDark: Bool) {
        self.view.backgroundColor = isDark ? .black : .white
        mongolTextView.setTextColor(textColor: isDark ? .white : .black)
        mongolTextView.tintColor = isDark ? .white : .black
    }
    
    @IBAction fileprivate func saveImageTapped(_ sender: Any) {
        mongolTextView.tintColor = .clear
        guard !mongolTextView.text.isEmpty, let selectedImage = mongolTextView.asImage() else {
            mongolTextView.tintColor = .black
            return }
        mongolTextView.tintColor = .black
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ImageDetailsVC") as! ImageDetailsVC
        vc.image = selectedImage
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction fileprivate func removeAllTextTapped(_ sender: Any) {
        mongolTextView.text = ""
    }
}
