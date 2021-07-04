//
//  ImageDetailsVC.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 15.04.2021.
//

import UIKit

class ImageDetailsVC: BaseVC {
    @IBOutlet fileprivate var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: "Z52HaraTigMirror", size: 16)
            let transform = CGAffineTransform.identity
            titleLabel.transform = transform.scaledBy(x: 1, y: -1)
        }
    }
    @IBOutlet fileprivate var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = image
    }
    
    var image: UIImage?
    
    fileprivate func saveImage() {
        guard let selectedImage = image else { return }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    //MARK: - Save Image callback

    @objc fileprivate func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showPopup(title: "Error", message: "Please add permision to your galery for the app in setting", isNeedDismiss: false)
            print(error.localizedDescription)
        } else {
            showPopup(title: "Success", message: "Image was added to your galery", isNeedDismiss: true)
        }
    }
    
    fileprivate func showPopup(title: String, message: String, isNeedDismiss: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if isNeedDismiss {
                self?.navigationController?.popViewController(animated: true)
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction fileprivate func saveImageTapped(_ sender: Any) {
        saveImage()
    }
    
    @IBAction fileprivate func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
