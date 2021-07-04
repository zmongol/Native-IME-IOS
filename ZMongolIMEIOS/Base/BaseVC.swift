//
//  BaseVC.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 06.04.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        listenNotifications()
        setupKeyboardDismissModeOnScrollViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = self.navigationController?.viewControllers.first != self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
    
    deinit {
        removeNotifications()
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    // MARK: - Private Methods
    fileprivate func setupKeyboardDismissModeOnScrollViews(){
        self.findScrollViews(in: self.view)
    }
    
    fileprivate func findScrollViews(in view: UIView){
        for subview in view.subviews{
            findScrollViews(in: subview)
            if subview is UIScrollView && !(subview is UITextView){
                (subview as! UIScrollView).keyboardDismissMode = .onDrag
            }
        }
    }
    
    // MARK: - Notification Methods
    
    func listenNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidChangeFrame(notification:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
    
    func removeNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
    
    func popToViewController(_ viewController: UIViewController.Type) {
        for controller in navigationController!.viewControllers as Array {
            if controller.isKind(of: viewController) {
                navigationController!.popTo(vc: controller, animated: true, completion: nil)
                break
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func onBtnBack(_ sender: Any) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - NSNotifications
    @objc func keyboardWillHide(notification: NSNotification) {
        //override in child class
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        //override in child class
    }
    
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        //override in child class
    }
    
    @objc func keyboardDidChangeFrame(notification: NSNotification) {
        //override in child class
    }
    
}

extension BaseVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("SUPER USER SCROLL")
//        scrollView.keyboardDismissMode = .onDrag
    }
}
