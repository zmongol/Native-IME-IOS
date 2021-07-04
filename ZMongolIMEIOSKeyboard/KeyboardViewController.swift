//
//  KeyboardViewController.swift
//  ZMongolIMEIOSKeyboard
//
//  Created by Natalia Hudzeliak on 07.04.2021.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var mongolKeyboardView: MongolKeyboardView!
    var userInterfaceStyle: UIUserInterfaceStyle?
    
    var currentWord: String? {
        var lastWord: String?
        if let stringBeforeCursor = textDocumentProxy.documentContextBeforeInput {
            stringBeforeCursor.enumerateSubstrings(in: stringBeforeCursor.startIndex...,
                                                   options: .byWords)
            { word, _, _, _ in
                if let word = word {
                    lastWord = word
                }
            }
        }
        return lastWord
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MongolKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        mongolKeyboardView = objects.first as? MongolKeyboardView
        mongolKeyboardView.delegate = self
        
        guard let inputView = inputView else { return }
        inputView.addSubview(mongolKeyboardView)
        mongolKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mongolKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            mongolKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            mongolKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            mongolKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
        ])
        
        mongolKeyboardView.nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        mongolKeyboardView.setupArrs()
        
        userInterfaceStyle = self.traitCollection.userInterfaceStyle
        setupUI()
        for family: String in UIFont.familyNames {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("=KeyboardViewController= \(names)")
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        setupUI()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        // Trait collection will change. Use this one so you know what the state is changing to.
        
        userInterfaceStyle = newCollection.userInterfaceStyle
    }

    private func setupUI() {
        switch userInterfaceStyle {
        case .dark:
            mongolKeyboardView.modeChange(isDark: true)
        case .light:
            mongolKeyboardView.modeChange(isDark: false)
        default:
            break
        }
    }
}

// MARK: - MorseKeyboardViewDelegate
extension KeyboardViewController: MongolKeyboardViewDelegate {
    
    func getInputedText() -> String? {
        return (textDocumentProxy.documentContextBeforeInput ?? "") + (textDocumentProxy.documentContextAfterInput ?? "")
    }
    
  func insertCharacter(_ newCharacter: String) {
    let value = (textDocumentProxy.documentContextBeforeInput ?? "") + (textDocumentProxy.documentContextAfterInput ?? "")
    print(value)
    textDocumentProxy.insertText(newCharacter)
    if newCharacter != " ", newCharacter != "\r" {
        textDocumentProxy.insertText(" ")
    }
    
  }

  func deleteCharacterBeforeCursor() {
    textDocumentProxy.deleteBackward()
  }

  func characterBeforeCursor() -> String? {
    guard let character = textDocumentProxy.documentContextBeforeInput?.last else {
      return nil
    }
    return String(character)
  }
}
