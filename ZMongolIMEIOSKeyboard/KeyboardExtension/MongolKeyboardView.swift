//
//  MongolKeyboardView.swift
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 07.04.2021.
//

import UIKit
import CoreServices

protocol MongolKeyboardViewDelegate: class {
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> String?
    func getInputedText() -> String?
}

class MongolKeyboardView: UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet fileprivate var checkWithLabel: UILabel! {
        didSet {
            checkWithLabel.font = UIFont(name: "Z52HaraTig", size: 26)
        }
    }
    @IBOutlet fileprivate var suggestionTVHeight: NSLayoutConstraint!
    @IBOutlet var enteredTextLabel: UILabel!
    @IBOutlet fileprivate var suggestionTableView: UIMongolTableView!
    @IBOutlet fileprivate var shareButtonView: UIView!
    @IBOutlet fileprivate var shareButton: UIButton!
    
    @IBOutlet fileprivate var qButton: UIButton!
    @IBOutlet fileprivate var wButton: UIButton!
    @IBOutlet fileprivate var eButton: UIButton!
    @IBOutlet fileprivate var rButton: UIButton!
    @IBOutlet fileprivate var tButton: UIButton!
    @IBOutlet fileprivate var yButton: UIButton!
    @IBOutlet fileprivate var uButton: UIButton!
    @IBOutlet fileprivate var iButton: UIButton!
    @IBOutlet fileprivate var oButton: UIButton!
    @IBOutlet fileprivate var pButton: UIButton!
    
    @IBOutlet fileprivate var aButton: UIButton!
    @IBOutlet fileprivate var sButton: UIButton!
    @IBOutlet fileprivate var dButton: UIButton!
    @IBOutlet fileprivate var fButton: UIButton!
    @IBOutlet fileprivate var gButton: UIButton!
    @IBOutlet fileprivate var hButton: UIButton!
    @IBOutlet fileprivate var jButton: UIButton!
    @IBOutlet fileprivate var kButton: UIButton!
    @IBOutlet fileprivate var lButton: UIButton!
    
    @IBOutlet fileprivate var zButton: UIButton!
    @IBOutlet fileprivate var xButton: UIButton!
    @IBOutlet fileprivate var cButton: UIButton!
    @IBOutlet fileprivate var vButton: UIButton!
    @IBOutlet fileprivate var bButton: UIButton!
    @IBOutlet fileprivate var nButton: UIButton!
    @IBOutlet fileprivate var mButton: UIButton!
    
    @IBOutlet fileprivate var dotButton: UIButton!
    @IBOutlet fileprivate var doubleDotButton: UIButton!
    
    @IBOutlet fileprivate var capsButton: UIButton!
    @IBOutlet fileprivate var numbersButton: UIButton!
    @IBOutlet fileprivate var deleteButton: UIButton!
    @IBOutlet fileprivate var newLineButton: UIButton!
    
    @IBOutlet fileprivate var qTitleLabel: UILabel!
    @IBOutlet fileprivate var wTitleLabel: UILabel!
    @IBOutlet fileprivate var eTitleLabel: UILabel!
    @IBOutlet fileprivate var rTitleLabel: UILabel!
    @IBOutlet fileprivate var tTitleLabel: UILabel!
    @IBOutlet fileprivate var yTitleLabel: UILabel!
    @IBOutlet fileprivate var uTitleLabel: UILabel!
    @IBOutlet fileprivate var iTitleLabel: UILabel!
    @IBOutlet fileprivate var oTitleLabel: UILabel!
    @IBOutlet fileprivate var pTitleLabel: UILabel!
    @IBOutlet fileprivate var aTitleLabel: UILabel!
    @IBOutlet fileprivate var sTitleLabel: UILabel!
    @IBOutlet fileprivate var dTitleLabel: UILabel!
    @IBOutlet fileprivate var fTitleLabel: UILabel!
    @IBOutlet fileprivate var gTitleLabel: UILabel!
    @IBOutlet fileprivate var hTitleLabel: UILabel!
    @IBOutlet fileprivate var jTitleLabel: UILabel!
    @IBOutlet fileprivate var kTitleLabel: UILabel!
    @IBOutlet fileprivate var lTitleLabel: UILabel!
    @IBOutlet fileprivate var zTitleLabel: UILabel!
    @IBOutlet fileprivate var xTitleLabel: UILabel!
    @IBOutlet fileprivate var cTitleLabel: UILabel!
    @IBOutlet fileprivate var vTitleLabel: UILabel!
    @IBOutlet fileprivate var bTitleLabel: UILabel!
    @IBOutlet fileprivate var nTitleLabel: UILabel!
    @IBOutlet fileprivate var mTitleLabel: UILabel!
    @IBOutlet fileprivate var dotTitleLabel: UILabel!
    @IBOutlet fileprivate var doubleDotTitleLabel: UILabel!
    
    @IBOutlet fileprivate var qSubtitleLabel: UILabel!
    @IBOutlet fileprivate var wSubtitleLabel: UILabel!
    @IBOutlet fileprivate var eSubtitleLabel: UILabel!
    @IBOutlet fileprivate var rSubtitleLabel: UILabel!
    @IBOutlet fileprivate var tSubtitleLabel: UILabel!
    @IBOutlet fileprivate var ySubtitleLabel: UILabel!
    @IBOutlet fileprivate var uSubtitleLabel: UILabel!
    @IBOutlet fileprivate var iSubtitleLabel: UILabel!
    @IBOutlet fileprivate var oSubtitleLabel: UILabel!
    @IBOutlet fileprivate var pSubtitleLabel: UILabel!
    @IBOutlet fileprivate var aSubtitleLabel: UILabel!
    @IBOutlet fileprivate var sSubtitleLabel: UILabel!
    @IBOutlet fileprivate var dSubtitleLabel: UILabel!
    @IBOutlet fileprivate var fSubtitleLabel: UILabel!
    @IBOutlet fileprivate var gSubtitleLabel: UILabel!
    @IBOutlet fileprivate var hSubtitleLabel: UILabel!
    @IBOutlet fileprivate var jSubtitleLabel: UILabel!
    @IBOutlet fileprivate var kSubtitleLabel: UILabel!
    @IBOutlet fileprivate var lSubtitleLabel: UILabel!
    @IBOutlet fileprivate var zSubtitleLabel: UILabel!
    @IBOutlet fileprivate var xSubtitleLabel: UILabel!
    @IBOutlet fileprivate var cSubtitleLabel: UILabel!
    @IBOutlet fileprivate var vSubtitleLabel: UILabel!
    @IBOutlet fileprivate var bSubtitleLabel: UILabel!
    @IBOutlet fileprivate var nSubtitleLabel: UILabel!
    @IBOutlet fileprivate var mSubtitleLabel: UILabel!
    
    @IBOutlet fileprivate var spaceButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet fileprivate var imagePreviewContainer: UIView!
    @IBOutlet fileprivate var savedLabel: UILabel!
    @IBOutlet fileprivate var insertImageButton: UIButton!
    @IBOutlet fileprivate var saveToPhotosButton: UIButton!
    @IBOutlet fileprivate var backImagePreviewButton: UIButton!
    @IBOutlet fileprivate var mongolianTextView: UIMongolTextView!
    
    private var isCapitalized = false
    private var isSymbols = false
    private let suggestions = Alhorith()
    private let wrapper: CPPSuggestions_Wrapper = CPPSuggestions_Wrapper()
    private let sqliteHelper = SQLiteHelper()
    
    private var suggestionModels: [String] = [] {
        didSet {
            suggestionTableView.reloadData()
            checkMaxHeight()
        }
    }
    private var enteredText = "" {
        didSet {
            enteredTextLabel.text = enteredText
            guard !enteredText.isEmpty else {
                suggestionModels = suggestions.teinIlgalCands
                return
            }
            
            suggestionModels = []
            if let firstPart = wrapper.excuteCPPEx(enteredText) as? [String] {
                suggestionModels.insert(contentsOf: firstPart, at: 0)
            }
            
            if (enteredText == "q") {
                suggestionModels.append(contentsOf: suggestions.qArray)
            }
            
            if (enteredText == "c") {
                suggestionModels.append(contentsOf: suggestions.vArray)
            }
            
            var second = sqliteHelper.read(dbTable: enteredText[0].lowercased(), latin: enteredText).map{$0.mongolWord}
            
            
            if !second.isEmpty {
                var index = 0
                
                repeat {
                    if (suggestionModels.first == second[index].trimmingCharacters(in: .whitespacesAndNewlines)) {
                        second.remove(at: index)
                    } else {
                        suggestionModels.append(second[index])
                    }
                    index += 1
                } while (index < second.count)
            }
        }
    }
    
    private var titleLabelsArr: [UILabel] = []
    private var subtitleLabelsArr: [UILabel] = []
    
    private let lowCharsArr: [String] = ["ᢚ", "ᢟ", "ᡥᡨ", "ᢞ", "ᢘ", "ᢜ", "ᡥᡭᡬ", "ᡥᡫ", "ᡥᡭ", "ᡶ", "ᡥᡧ", "ᢔᡮ", "ᢙ", "ᢡ", "ᢈ", "ᠬ", "ᡬ", "ᢤ", "ᢏ", "ᢧ", "ᢗᡮ", "ᢚ", "ᡥᡭ", "ᡳ", "ᡯ", "ᢌ"]
    private let upCharsArr: [String] = ["ᢦ", "ᢟ", "ᢟ", "ᢞ", "ᢙ", "ᢜ", "ᡭᡬ", "ᡥᡫ", "ᡭ", "ᡶ", "ᡥᡧ", "ᢔᡮ", "ᢘ", "ᢡ", "ᢈ", "ᠬ", "ᡬ", "ᢤ", "ᢏᢨ", "ᢨ", "ᢗᡮ", "ᢦ", "ᡭ", "ᡳ", "ᡯ", "ᢌ"]
    private let symbolsArr: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "ᡣ", "ᡐ", "ᡑ", "ᡕ", "ᡖ", "᠁", "ᡗ", "ᡘ", "ᡏ", "᠄", "ᡛ", "ᡜ", "ᡓ", "ᡒ", "ᡙ", "ᡚ"]
    
    weak var delegate: MongolKeyboardViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupArrs() {
        titleLabelsArr = [qTitleLabel, wTitleLabel, eTitleLabel, rTitleLabel, tTitleLabel, yTitleLabel, uTitleLabel, iTitleLabel, oTitleLabel, pTitleLabel, aTitleLabel, sTitleLabel, dTitleLabel, fTitleLabel, gTitleLabel, hTitleLabel, jTitleLabel, kTitleLabel, lTitleLabel, zTitleLabel, xTitleLabel, cTitleLabel, vTitleLabel, bTitleLabel, nTitleLabel, mTitleLabel]
        
        subtitleLabelsArr = [qSubtitleLabel, wSubtitleLabel, eSubtitleLabel, rSubtitleLabel, tSubtitleLabel, ySubtitleLabel, uSubtitleLabel, iSubtitleLabel, oSubtitleLabel, pSubtitleLabel, aSubtitleLabel, sSubtitleLabel, dSubtitleLabel, fSubtitleLabel, gSubtitleLabel, hSubtitleLabel, jSubtitleLabel, kSubtitleLabel, lSubtitleLabel, zSubtitleLabel, xSubtitleLabel, cSubtitleLabel, vSubtitleLabel, bSubtitleLabel, nSubtitleLabel, mSubtitleLabel]
        
        capsButton.setTitle("", for: .normal)
        capsButton.setImage(#imageLiteral(resourceName: "capsLockIcon"), for: .normal)
        
        
        dotTitleLabel.text = "᠂"
        doubleDotTitleLabel.text = "᠃"
        dotTitleLabel.font = UIFont(name: "Z52HaraTig", size: 26)
        doubleDotTitleLabel.font = UIFont(name: "Z52HaraTig", size: 26)
        
        setupFonts(needCustomFont: true)
        setupButtons()
        
        suggestionTableView.delegate = self
        suggestionTableView.dataSource = self
        self.suggestionTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        suggestionModels = suggestions.teinIlgalCands
    }
    
    fileprivate func setupButtons() {
        
        if isSymbols {
            transformLabels(isNeedTransform: false)
            if !subtitleLabelsArr[0].isHidden {
                for label in subtitleLabelsArr {
                    label.isHidden = true
                }
            }
            for (index, label) in titleLabelsArr.enumerated() {
                label.text = symbolsArr[index]
            }
            capsButton.setTitle(".", for: .normal)
            capsButton.setImage(nil, for: .normal)
            numbersButton.setTitle("MN", for: .normal)
        } else {
            numbersButton.setTitle("123", for: .normal)
            if subtitleLabelsArr[0].isHidden {
                for label in subtitleLabelsArr {
                    label.isHidden = false
                }
            }
            transformLabels(isNeedTransform: true)
            if isCapitalized {
                for (index, label) in titleLabelsArr.enumerated() {
                    label.text = upCharsArr[index]
                }
            } else {
                for (index, label) in titleLabelsArr.enumerated() {
                    label.text = lowCharsArr[index]
                }
            }
            capsButton.setTitle("", for: .normal)
            capsButton.setImage(#imageLiteral(resourceName: "capsLockIcon"), for: .normal)
        }
    }
    
    fileprivate func setupFonts(needCustomFont: Bool) {
        if needCustomFont {
            for label in titleLabelsArr {
                label.font = UIFont(name: "Z52HaraTig", size: 26)
            }
        } else {
            for label in titleLabelsArr {
                label.font = UIFont(name: "Z52HaraTig", size: 26)
            }
        }
    }
    
    fileprivate func transformLabels(isNeedTransform: Bool) {
        var transform = CGAffineTransform.identity
        transform = transform.rotated(by: CGFloat(Double.pi/2))
        
        dotTitleLabel.transform = transform
        doubleDotTitleLabel.transform = transform
        if isNeedTransform {
            for label in titleLabelsArr {
                label.transform = transform
            }
        } else {
            let labels = [qTitleLabel, wTitleLabel, eTitleLabel, rTitleLabel, tTitleLabel, yTitleLabel, uTitleLabel, iTitleLabel, oTitleLabel, pTitleLabel]
            for label in labels {
                transform = CGAffineTransform(rotationAngle: 0)
                label?.transform = transform
            }
        }
    }
    
    fileprivate func checkMaxHeight() {
        var allWidth: [CGFloat] = []
        for text in suggestionModels {
            checkWithLabel.text = text
            let width = checkWithLabel.intrinsicContentSize.width + 15
            allWidth.append(width)
        }
        let screenHeight = UIScreen.main.bounds.height * 0.3
        if allWidth.max() ?? 0.0 < 80.0 {
            suggestionTVHeight.constant = 80
        } else if allWidth.max() ?? 0.0 > screenHeight {
            suggestionTVHeight.constant = screenHeight
        } else {
            suggestionTVHeight.constant = allWidth.max() ?? 0.0
        }
    }
    
    func modeChange(isDark: Bool) {
        nextButton.tintColor = isDark ? .white : .black
        shareButton.tintColor = isDark ? .white : .black
        capsButton.tintColor = isDark ? .white : .black
        deleteButton.tintColor = isDark ? .white : .black
        newLineButton.tintColor = isDark ? .white : .black
        capsButton.setTitleColor(isDark ? .white : .black, for: .normal)
        numbersButton.setTitleColor(isDark ? .white : .black, for: .normal)
        spaceButton.setTitleColor(isDark ? .white : .black, for: .normal)
        insertImageButton.tintColor = isDark ? .white : .black
        saveToPhotosButton.tintColor = isDark ? .white : .black
        backImagePreviewButton.tintColor = isDark ? .white : .black
        mongolianTextView.setSmallFont(textColor: isDark ? .white : .black)
        savedLabel.textColor = isDark ? .white : .black
        configureSubtitleAndTitleLabels(isDark: isDark)
    }
    
    func configureSubtitleAndTitleLabels(isDark: Bool) {
        for label in subtitleLabelsArr {
            label.textColor = isDark ? .white : .black
        }
    }
    
    fileprivate func saveImage() {
        guard let selectedImage = mongolianTextView.asImage() else { return }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //MARK: - Save Image callback
    
    @objc fileprivate func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        savedLabel.isHidden = false
        savedLabel.layer.cornerRadius = 15
        if let error = error {
            savedLabel.text = "  Please add permision to your   \n galery for the app in setting   "
        } else {
            savedLabel.text = "   Image was added to your  \n   galery now you can  \n   add it to you message   "
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            self?.imagePreviewContainer.isHidden = true
        })
    }
    
    @IBAction fileprivate func qButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("1")
        } else {
            if isCapitalized {
                enteredText.append("Q")
            } else {
                enteredText.append("q")
            }
        }
    }
    @IBAction fileprivate func wButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("2")
        } else {
            enteredText.append("w")
        }
    }
    @IBAction fileprivate func eButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("3")
        } else {
            if isCapitalized {
                enteredText.append("E")
            } else {
                enteredText.append("e")
            }
        }
    }
    @IBAction fileprivate func rButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("4")
        } else {
            enteredText.append("r")
        }
    }
    @IBAction fileprivate func tButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("5")
        } else {
            if isCapitalized {
                enteredText.append("T")
            } else {
                enteredText.append("t")
            }
        }
    }
    @IBAction fileprivate func yButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("6")
        } else {
            enteredText.append("y")
        }
    }
    @IBAction fileprivate func uButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("7")
        } else {
            if isCapitalized {
                enteredText.append("U")
            } else {
                enteredText.append("u")
            }
        }
    }
    @IBAction fileprivate func iButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("8")
        } else {
            enteredText.append("i")
        }
    }
    @IBAction fileprivate func oButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("9")
        } else {
            if isCapitalized {
                enteredText.append("O")
            } else {
                enteredText.append("o")
            }
        }
    }
    @IBAction fileprivate func pButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("0")
        } else {
            enteredText.append("p")
        }
    }
    
    @IBAction fileprivate func aButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡣ")
        } else {
            enteredText.append("a")
        }
    }
    @IBAction fileprivate func sButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡐ")
        } else {
            enteredText.append("s")
        }
    }
    @IBAction fileprivate func dButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡑ")
        } else {
            if isCapitalized {
                enteredText.append("D")
            } else {
                enteredText.append("d")
            }
        }
    }
    @IBAction fileprivate func fButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡕ")
        } else {
            enteredText.append("f")
        }
    }
    @IBAction fileprivate func gButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡖ")
        } else {
            enteredText.append("g")
        }
    }
    @IBAction fileprivate func hButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("᠁")
        } else {
            enteredText.append("h")
        }
    }
    @IBAction fileprivate func jButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡗ")
        } else {
            enteredText.append("j")
        }
    }
    @IBAction fileprivate func kButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡘ")
        } else {
            enteredText.append("k")
        }
    }
    @IBAction fileprivate func lButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡏ")
        } else {
            if isCapitalized {
                enteredText.append("L")
            } else {
                enteredText.append("l")
            }
        }
    }
    
    @IBAction fileprivate func zButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("᠄")
        } else {
            if isCapitalized {
                enteredText.append("Z")
            } else {
                enteredText.append("z")
            }
        }
    }
    @IBAction fileprivate func xButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡛ")
        } else {
            enteredText.append("x")
        }
    }
    @IBAction fileprivate func cButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡜ")
        } else {
            if isCapitalized {
                enteredText.append("C")
            } else {
                enteredText.append("c")
            }
        }
    }
    @IBAction fileprivate func vButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡓ")
        } else {
            if isCapitalized {
                enteredText.append("V")
            } else {
                enteredText.append("v")
            }
        }
    }
    @IBAction fileprivate func bButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡒ")
        } else {
            enteredText.append("b")
        }
    }
    @IBAction fileprivate func nButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡙ")
        } else {
            enteredText.append("n")
        }
    }
    @IBAction fileprivate func mButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter("ᡚ")
        } else {
            enteredText.append("m")
        }
    }
    
    @IBAction fileprivate func dotButtonPressed(_ sender: Any) {
        if !enteredText.isEmpty, enteredText != "" {
            delegate?.insertCharacter(suggestionModels[safe: 0] ?? "")
            delegate?.insertCharacter("᠂")
            enteredText = ""
        } else {
            delegate?.insertCharacter("᠂")
            enteredText = ""
        }
    }
    @IBAction fileprivate func doubleDotButtonPressed(_ sender: Any) {
        if !enteredText.isEmpty, enteredText != "" {
            delegate?.insertCharacter(suggestionModels[safe: 0] ?? "")
            delegate?.insertCharacter("᠃")
            enteredText = ""
        } else {
            delegate?.insertCharacter("᠃")
            enteredText = ""
        }
    }
    
    @IBAction fileprivate func capsButtonPressed(_ sender: Any) {
        if isSymbols {
            delegate?.insertCharacter(".")
        } else {
            isCapitalized.toggle()
            setupButtons()
        }
    }
    @IBAction fileprivate func numbersButtonPressed(_ sender: Any) {
        isCapitalized = false
        isSymbols.toggle()
        setupFonts(needCustomFont: !isSymbols)
        setupButtons()
        if !enteredText.isEmpty, enteredText != "" {
            delegate?.insertCharacter(suggestionModels[safe: 0] ?? "")
            enteredText = ""
        } else {
            enteredText = ""
        }
    }
    @IBAction fileprivate func deleteButtonPressed(_ sender: Any) {
        if !enteredText.isEmpty, enteredText != "" {
            enteredText.removeLast()
        } else {
            delegate?.deleteCharacterBeforeCursor()
        }
    }
    
    @IBAction fileprivate func newLineButtonPressed(_ sender: Any) {
        if !enteredText.isEmpty {
            delegate?.insertCharacter(suggestionModels[safe: 0] ?? "")
        }
        enteredText = ""
        delegate?.insertCharacter("\r")
    }
    
    @IBAction fileprivate func spaceButtonPressed(_ sender: Any) {
        if !enteredText.isEmpty {
            delegate?.insertCharacter(suggestionModels[safe: 0] ?? "")
        }
        enteredText = ""
        delegate?.insertCharacter(" ")
    }
    
    @IBAction fileprivate func shareImageButtonPressed(_ sender: Any) {
        guard let text = delegate?.getInputedText(), !text.isEmpty else { return }
        imagePreviewContainer.isHidden = false
        savedLabel.isHidden = true
        mongolianTextView.text = text
        mongolianTextView.scrollEnabled = false
        if text.count > 300 {
            mongolianTextView.setFont(size: 26)
        } else if text.count > 200 {
            mongolianTextView.setFont(size: 35)
        } else if text.count > 100 {
            mongolianTextView.setFont(size: 43)
        } else if text.count > 70 {
            mongolianTextView.setFont(size: 53)
        } else if text.count > 40 {
            mongolianTextView.setFont(size: 58)
        } else {
            mongolianTextView.setFont(size: 80)
        }
        mongolianTextView.tintColor = .clear
    }
    
    @IBAction func shareImagePressed(_ sender: Any) {
        guard let selectedImage = mongolianTextView.asImage() else { return }
        
        let pb = UIPasteboard.general
        pb.image = selectedImage
//        let url = saveImage(selectedImage, name: "savedMilan.jpg")
//        let nsRange = NSMakeRange(5, 3)
//        let urlString = url?.absoluteString.replacingOccurrences(of: "file:///", with: "/")
//        delegate?.insertCharacter(urlString ?? "")
//        delegate?.insertCharacter(" ")
//        enteredText = ""
//        shouldAddImage(oneImage:selectedImage,filePath: urlString ?? "")
        savedLabel.isHidden = false
        savedLabel.layer.cornerRadius = 7
        savedLabel.text = "   Image was copied   "
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            self?.imagePreviewContainer.isHidden = true
        })
    }
    // saves an image, if save is successful, returns its URL on local storage, otherwise returns nil
//    func saveImage(_ image: UIImage, name: String) -> URL? {
//        guard let imageData = image.jpegData(compressionQuality: 1) else {
//            return nil
//        }
//        do {
//            let imageURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(name)
//            try imageData.write(to: imageURL)
//            return imageURL
//        } catch {
//            return nil
//        }
//    }
    
//    func shouldAddImage(oneImage:UIImage,filePath:String) {
//        let onions = oneImage //UIImage.init(named: "0.png")!
//        let  mas :NSMutableAttributedString = NSMutableAttributedString(string: filePath)
//        let onionatt:NSTextAttachment = NSTextAttachment()
//        onionatt.image = onions
//        onionatt.bounds = CGRect(x: 0, y: -5, width: onions.size.width, height: onions.size.height)
//        let onionattchar = NSAttributedString(attachment: onionatt)
//
//        let range = (mas.string as NSString).range(of: "Onions")
//        mas.insert(onionattchar, at: 0)
//        let string2 = mas.string
//        delegate?.insertCharacter(string2)
//        delegate?.insertCharacter("\n")
//    }
    
    
    @IBAction func saveToGaleryButton(_ sender: Any) {
        saveImage()
    }
    
    @IBAction func backButton(_ sender: Any) {
        imagePreviewContainer.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = (self.suggestionTableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell)!
        cell.textLabel?.text = suggestionModels[indexPath.row]
        cell.textLabel?.lineBreakMode = .byClipping
        cell.textLabel?.font = UIFont(name: "Z52HaraTigMirror", size: 26)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.insertCharacter(suggestionModels[safe: indexPath.row] ?? "")
        //delegate?.insertCharacter(" ")
        enteredText = ""
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
