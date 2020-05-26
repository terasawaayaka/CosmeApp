//
//  CreateReviewMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol CreateReviewMainViewDelegate: NSObjectProtocol{
    func touchedAddFirstImageButton()
    func touchedAddSecondImageButton()
    func touchedAddThirdImageButton()
    func touchedAddFourthImageButton()
    func firstStarButton()
    func secondStarButton()
    func thirdStarButton()
    func fourthStarButton()
    func fifthStarButton()
}
extension CreateReviewMainViewDelegate {
}
// MARK: - Property
class CreateReviewMainView: BaseView {
    weak var delegate: CreateReviewMainViewDelegate? = nil
    
    @IBOutlet weak var itemFirstImageVIew: UIImageView! //左上
    @IBOutlet weak var itemSecondImageView: UIImageView! //右上
    @IBOutlet weak var itemThirdImageView: UIImageView! //左下
    @IBOutlet weak var itemFourthImageView: UIImageView! //右下
    @IBAction func touchedAddFirstImageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddFirstImageButton()
        }
    }
    @IBAction func touchedAddImageSecondButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddSecondImageButton()
        }
    }
    @IBAction func touchedAddThirdImageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddThirdImageButton()
        }
    }
    @IBAction func touchedAddFourthImageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddFourthImageButton()
        }
    }
   
    @IBOutlet weak var firstStarButton: UIButton!
    @IBOutlet weak var secondStarButton: UIButton!
    @IBOutlet weak var thirdStarButton: UIButton!
    @IBOutlet weak var fourthStarButton: UIButton!
    @IBOutlet weak var fifthStarButton: UIButton!
    
    @IBAction func firstStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.firstStarButton()
        }
    }
    @IBAction func secondStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.secondStarButton()
        }
    }
    @IBAction func thirdStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.thirdStarButton()
        }
    }
    @IBAction func fourthStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.fourthStarButton()
        }
    }
    @IBAction func fifthStarButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.fifthStarButton()
        }
    }
    
    @IBOutlet weak var itemTextView: UITextView!
    @IBOutlet weak var pickerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var tagTextView: UITextView!
    
    var isFirstStarSelected: Bool = false
    var isSecondStarSelected: Bool = false
    var isThirdStarSelected: Bool = false
    var isFourthStarSelected: Bool = false
    var isFifthStarSelected: Bool = false
}
// MARK: - Life cycle
extension CreateReviewMainView {
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
// MARK: - Protocol
extension CreateReviewMainView {
}

// MARK: - method
extension CreateReviewMainView {
    func updateStar() {
        if isFifthStarSelected {
            firstStarButton.setTitleColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), for: .normal)
        } else {
            firstStarButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        }
        if isSecondStarSelected {
            let image = UIImage(named: "star")
            secondStarButton.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "checkedStar")
            secondStarButton.setImage(image, for: .normal)
        }
    }
}
